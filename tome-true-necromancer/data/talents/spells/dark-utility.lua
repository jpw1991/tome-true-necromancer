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

newTalent {
	name = "Dark Recall",
	type = {"spell/dark-utility",1},
	require = spells_req_high1,
	points = 5,
	random_ego = "attack",
	mana = 25,
	cooldown = 20,
	range = 10,
	tactical = { DEFEND = 2 },
	requires_target = true,
	getChance = function(self, t) return 20 + self:combatTalentSpellDamage(t, 15, 60) end,
	action = function(self, t)
		local list = {}
		if game.party and game.party:hasMember(self) then
			for act, def in pairs(game.party.members) do
				if act.summoner and act.summoner == self and act.necrotic_minion then list[#list+1] = act end
			end
		else
			for uid, act in pairs(game.level.entities) do
				if act.summoner and act.summoner == self and act.necrotic_minion then list[#list+1] = act end
			end
		end

		local empower = necroEssenceDead(self)
		for i, m in ipairs(list) do
			local x, y = util.findFreeGrid(self.x, self.y, 5, true, {[Map.ACTOR]=true})
			if x and y then
				m:move(x, y, true)
				game.level.map:particleEmitter(x, y, 1, "summon")
			end
			m:setEffect(m.EFF_EVASION, 5, {chance=t.getChance(self, t)})
			if empower then
				m:heal(m.max_life * 0.3)
				if core.shader.active(4) then
					m:addParticles(Particles.new("shader_shield_temp", 1, {toback=true , size_factor=1.5, y=-0.3, img="healdark", life=25}, {type="healing", time_factor=6000, beamsCount=15, noup=2.0, beamColor1={0xcb/255, 0xcb/255, 0xcb/255, 1}, beamColor2={0x35/255, 0x35/255, 0x35/255, 1}}))
					m:addParticles(Particles.new("shader_shield_temp", 1, {toback=false, size_factor=1.5, y=-0.3, img="healdark", life=25}, {type="healing", time_factor=6000, beamsCount=15, noup=1.0, beamColor1={0xcb/255, 0xcb/255, 0xcb/255, 1}, beamColor2={0x35/255, 0x35/255, 0x35/255, 1}}))
				end
			end
		end
		if empower then empower() end

		game:playSoundNear(self, "talents/spell_generic")
		return true
	end,
	info = function(self, t)
		local chance = t.getChance(self, t)
		return ([[Surround your minions in a veil of darkness. The darkness will teleport them to you, and grant them %d%% evasion for 5 turns.
		The evasion chance will increase with your Spellpower.]]):
		format(chance)
	end,
}

newTalent {
	name = "Detonate Minion",
	type = {"spell/dark-utility",2},
	require = spells_req_high2,
	points = 5,
	mana = 30,
	cooldown = 10,
	tactical = { ATTACKAREA = { BLIGHT = 2 } },
	radius = function(self, t) return math.floor(self:combatTalentScale(t, 1.3, 2.7)) end,
	range = 8,
	requires_target = true,
	no_npc_use = true,
	getDamage = function(self, t) return self:combatLimit(self:combatTalentSpellDamage(t, 20, 70), 90, 0, 0, 25, 25) end, -- Limit to 50% life
	action = function(self, t)
		local tg = {type="hit", range=self:getTalentRange(t), talent=t, first_target="friend"}
		local tx, ty, target = self:getTarget(tg)
		if not tx or not ty or not target or not target.summoner or not target.summoner == self or not target.necrotic_minion then return nil end

		local tg = {type="ball", range=self:getTalentRange(t), radius=self:getTalentRadius(t), talent=t, friendlyfire=not rng.percent(self:getTalentLevelRaw(self.T_CONSIDERATE_MINIONS) * 0.2)}
		local dam = target.max_life * t.getDamage(self, t) / 100
		target:die()
		target:project(tg, target.x, target.y, DamageType.BLIGHT, dam)
		game.level.map:particleEmitter(target.x, target.y, tg.radius, "ball_acid", {radius=tg.radius})

		game:playSoundNear(self, "talents/fireflash")
		return true
	end,
	info = function(self, t)
		return ([[Minions are only tools. You may dispose of them... Violently.
		Makes the targeted minion explode for %d%% of its maximum life in a radius of %d as blight damage.
		Beware! Don't get caught in the blast! (unless you know Dark Empthy: %d%% chance to ignore damage)]]):
		format(t.getDamage(self, t),t.radius(self,t), self:getTalentLevelRaw(self.T_CONSIDERATE_MINIONS) * 20)
	end,
}

newTalent {
	name = "Necrotic Frenzy",
	type = {"spell/dark-utility",3},
	require = spells_req_high3,
	points = 5,
	mana = 45,
	cooldown = 20,
	tactical = { ATTACKAREA = 2 },
	getPower = function(self, t) return self:combatTalentSpellDamage(t, 10, 60) end,
	getCrit = function(self, t) return self:combatTalentSpellDamage(t, 6, 25) end,
	getAPR = function(self, t) return self:combatTalentSpellDamage(t, 10, 50) end,
	action = function(self, t)
		local apply = function(a)
			a:setEffect(a.EFF_SURGE_OF_UNDEATH, 6, {power=t.getPower(self, t), apr=t.getAPR(self, t), crit=t.getCrit(self, t)})
		end

		if game.party and game.party:hasMember(self) then
			for act, def in pairs(game.party.members) do
				if act.summoner and act.summoner == self and act.necrotic_minion then apply(act) end
			end
		else
			for uid, act in pairs(game.level.entities) do
				if act.summoner and act.summoner == self and act.necrotic_minion then apply(act) end
			end
		end

		game:playSoundNear(self, "talents/spell_generic2")
		return true
	end,
	info = function(self, t)
		return ([[A surge of power radiates to all your minions, increasing their Physical Power, Spellpower and Accuracy by %d, their Armour penetration by %d and their critical hit chance by %d for 6 turns.
		The effects will increase with your Spellpower.]]):
		format(t.getPower(self, t), t.getAPR(self, t), t.getCrit(self, t))
	end,
}

newTalent{
	name = "Considerate Minions",
	type = {"spell/dark-utility",4},
	require = spells_req_high4,
	points = 5,
	mode = "passive",
	getPerc = function(self, t) return self:combatTalentSpellDamage(t, 15, 80) end,
	info = function(self, t)
		return ([[You share your powers with your minions, granting them %d%% of your resistances and saves.
		In addition all damage done by your minions to you and themselves is reduced by %d%%.
		The effect will increase with your Spellpower.]]):
		format(t.getPerc(self, t), self:getTalentLevelRaw(t) * 20)
	end,
}
