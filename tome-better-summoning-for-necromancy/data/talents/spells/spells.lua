
--local _M = loadPrevious(...)

-- Necromancer spells
newTalentType {
  allow_random=true,
  no_silence=true,
  is_spell=true,
  mana_regen=true,
  type="spell/necrotic-mastery",
  name = "necrotic mastery",
  description = "Increase the quality of your undead minions."
}

newTalentType {
  allow_random=true,
  no_silence=true,
  is_spell=true,
  mana_regen=true,
  type="spell/skeletal-minions",
  name = "skeletal minions",
  description = "Create skeleton minions."
}

-------------------------------------------
-- Necromancer minions
function necroGetNbSummon(self)
	local nb = 0
	if not game.party or not game.party:hasMember(self) then return 0 end
	-- Count party members
	for act, def in pairs(game.party.members) do
		if act.summoner and act.summoner == self and act.necrotic_minion then nb = nb + 1 end
	end
	return nb
end

function applyDarkEmpathy(self, m)
	if self:knowTalent(self.T_TRUE_DARK_EMPATHY) then
		local t = self:getTalentFromId(self.T_TRUE_DARK_EMPATHY)
		local perc = t.getPerc(self, t)
		for k, e in pairs(self.resists) do
			m.resists[k] = (m.resists[k] or 0) + e * perc / 100
		end
		m.combat_physresist = m.combat_physresist + self:combatPhysicalResist() * perc / 100
		m.combat_spellresist = m.combat_spellresist + self:combatSpellResist() * perc / 100
		m.combat_mentalresist = m.combat_mentalresist + self:combatMentalResist() * perc / 100

		m.poison_immune = (m.poison_immune or 0) + (self:attr("poison_immune") or 0) * perc / 100
		m.disease_immune = (m.disease_immune or 0) + (self:attr("disease_immune") or 0) * perc / 100
		m.cut_immune = (m.cut_immune or 0) + (self:attr("cut_immune") or 0) * perc / 100
		m.confusion_immune = (m.confusion_immune or 0) + (self:attr("confusion_immune") or 0) * perc / 100
		m.blind_immune = (m.blind_immune or 0) + (self:attr("blind_immune") or 0) * perc / 100
		m.silence_immune = (m.silence_immune or 0) + (self:attr("silence_immune") or 0) * perc / 100
		m.disarm_immune = (m.disarm_immune or 0) + (self:attr("disarm_immune") or 0) * perc / 100
		m.pin_immune = (m.pin_immune or 0) + (self:attr("pin_immune") or 0) * perc / 100
		m.stun_immune = (m.stun_immune or 0) + (self:attr("stun_immune") or 0) * perc / 100
		m.fear_immune = (m.fear_immune or 0) + (self:attr("fear_immune") or 0) * perc / 100
		m.knockback_immune = (m.knockback_immune or 0) + (self:attr("knockback_immune") or 0) * perc / 100
		m.stone_immune = (m.stone_immune or 0) + (self:attr("stone_immune") or 0) * perc / 100
		m.teleport_immune = (m.teleport_immune or 0) + (self:attr("teleport_immune") or 0) * perc / 100

		m.necrotic_minion_be_nice = self:getTalentLevelRaw(self.T_TRUE_DARK_EMPATHY) * 0.2
	end
end

function necroSetupSummon(self, m, x, y, level, no_control, no_decay)
	m.faction = self.faction
	m.summoner = self
	m.summoner_gain_exp = true
	m.necrotic_minion = true
	m.exp_worth = 0
	m.life_regen = 0
	m.unused_stats = 0
	m.unused_talents = 0
	m.unused_generics = 0
	m.unused_talents_types = 0
	m.silent_levelup = true
	m.no_points_on_levelup = true
	m.ai_state = m.ai_state or {}
	m.ai_state.tactic_leash = 100
	-- Try to use stored AI talents to preserve tweaking over multiple summons
	m.ai_talents = self.stored_ai_talents and self.stored_ai_talents[m.name] or {}
	m.inc_damage = table.clone(self.inc_damage, true)
	m.no_breath = 1
	m.no_drops = true

	applyDarkEmpathy(self, m)

	if game.party:hasMember(self) then
		local can_control = not no_control

		m.remove_from_party_on_death = true
		game.party:addMember(m, {
			control=can_control and "full" or "no",
			type="minion",
			title="Necrotic Minion",
			orders = {target=true},
		})
	end
	m:resolve() m:resolve(nil, true)
	m.max_level = self.level + (level or 0)
	m:forceLevelup(math.max(1, self.level + (level or 0)))
	game.zone:addEntity(game.level, m, "actor", x, y)
	game.level.map:particleEmitter(x, y, 1, "summon")

  --[[
	-- Summons decay
	if not no_decay then
		m.necrotic_aura_decaying = self.necrotic_aura_decay
		m.on_act = function(self)
			local src = self.summoner
			if src and self.necrotic_aura_decaying and self.x and self.y and not src.dead and src.x and src.y and core.fov.distance(self.x, self.y, src.x, src.y) <= (src.true_necrotic_aura_radius or 0) then return end

			self.life = self.life - self.max_life * (self.necrotic_aura_decaying or 10) / 100
			self.changed = true
			if self.life <= 0 then
				game.logSeen(self, "#{bold}#%s decays into a pile of ash!#{normal}#", self.name:capitalize())
				if src then
					local t = src:getTalentFromId(src.T_TRUE_NECROTIC_AURA)
					t.die_speach(self, t)
				end
				self:die(self)
			end
		end
	end
  --]]

	m.on_die = function(self, killer)
		local src = self.summoner
		local w = src:isTalentActive(src.T_WILL_O__THE_WISP)
		local p = src:isTalentActive(src.T_TRUE_NECROTIC_AURA)
    game.logSeen(killer, "dead")
    -- restore the soul if dies within aura
    if p and core.fov.distance(self.x, self.y, src.x, src.y) >= (src.true_necrotic_aura_radius or 0) then
      game.logSeen(killer, "soul++")
      src:incSoul(1)
    else
      game.logSeen(killer, "soul--")
    end

		if not w or not p or not self.x or not self.y or not src.x or not src.y or core.fov.distance(self.x, self.y, src.x, src.y) > self.summoner.true_necrotic_aura_radius then return end
		if not rng.percent(w.chance) then return end

		local t = src:getTalentFromId(src.T_WILL_O__THE_WISP)
		t.summon(src, t, w.dam, self, killer)
	end

	-- Summons never flee
	m.ai_tactic = m.ai_tactic or {}
	m.ai_tactic.escape = 0

	if self:knowTalent(self.T_BLIGHTED_SUMMONING) then m:incVim(m:getMaxVim()) end

	self:attr("summoned_times", 1)
end

function necroEssenceDead(self, checkonly)
	local eff = self:hasEffect(self.EFF_ESSENCE_OF_THE_DEAD)
	if not eff then return false end
	if checkonly then return true end
	return function()
		eff.nb = eff.nb - 1
		if eff.nb <= 0 then self:removeEffect(self.EFF_ESSENCE_OF_THE_DEAD, true) end
	end
end

load("/data-bettersummoningfornecromancy/talents/spells/necrotic-mastery.lua")
load("/data-bettersummoningfornecromancy/talents/spells/skeletal-minions.lua")

--return _M
