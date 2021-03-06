-- ToME - Tales of Maj'Eyal
-- Copyright (C) 2009 - 2016 Nicolas Casalini
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
-- Nicolas Casalini "DarkGod"
-- darkgod@te4.org

-- True Necromancer spells
newTalentType {
  allow_random=true,
  no_silence=true,
  is_spell=true,
  mana_regen=true,
  type="spell/dark-mastery",
  name = "dark mastery",
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

newTalentType {
  allow_random=true,
  no_silence=true,
  is_spell=true,
  mana_regen=true,
  type="spell/fleshy-minions",
  name = "fleshy minions",
  description = "Create fleshy undead minions and constructs."
}
--[[
newTalentType {
  allow_random=true,
  no_silence=true,
  is_spell=true,
  mana_regen=true,
  type="spell/terrifying-minions",
  name = "terrifying minions",
  description = "Create advanced undead minions."
}
--]]

newTalentType {
  allow_random=true,
  no_silence=true,
  is_spell=true,
  mana_regen=true,
  type="spell/dark-utility",
  name = "dark utility",
  description = "Helpful spells."
}

-------------------------------------------
-- Necromancer minions
function trueNecroGetNbSummon(self, minion_type)
	local nb = 0
	if not game.party or not game.party:hasMember(self) then
    return 0
  end
	-- Count party members
	for act, def in pairs(game.party.members) do
		if act.summoner and act.summoner == self and act.necrotic_minion and act.minion_type == minion_type then
      nb = nb + 1
    end
	end
	return nb
end

function applyConsiderateMinions(self, m)
	if self:knowTalent(self.T_CONSIDERATE_MINIONS) then
		local t = self:getTalentFromId(self.T_CONSIDERATE_MINIONS)
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

		m.necrotic_minion_be_nice = self:getTalentLevelRaw(self.T_CONSIDERATE_MINIONS) * 0.2
	end
end

function applyMinionResistance(self, m)
  if self:knowTalent(self.T_MINION_RESISTANCE) then
    local t = self:getTalentFromId(self.T_MINION_RESISTANCE)
		local percent = t.getPercent(self, t)
    m.resists["all"] = percent
  end
end

function necroSetupSummon(self, m, x, y, level, no_control)
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

	applyConsiderateMinions(self, m)
  applyMinionResistance(self, m)

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

	m.on_die = function(self, killer)
		local src = self.summoner

    -- chance that the soul is returned to the true necromancer
    local refund_chance = src:getTalentLevelRaw(src.T_SOUL_RESERVE)
    local random_number = math.random(1, 100)
    if random_number <= refund_chance then
      src.incSoul(1)
    end
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

load("/data-truenecromancer/talents/spells/dark-mastery.lua")
load("/data-truenecromancer/talents/spells/skeletal-minions.lua")
load("/data-truenecromancer/talents/spells/fleshy-minions.lua")
--load("/data-truenecromancer/talents/spells/terrifying-minions.lua")
load("/data-truenecromancer/talents/spells/dark-utility.lua")
