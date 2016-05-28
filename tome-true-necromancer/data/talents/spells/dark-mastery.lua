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

newTalent{
	name = "Minion Strength",
	type = {"spell/dark-mastery",1},
	require = spells_req1,
	points = 5,
	mode = "passive",
	info = function(self, t)
		return ([[Increases the quality of your minions by increasing their level by %%d.]]):
		format(self:getTalentLevelRaw(t))
	end,
}

newTalent{
	name = "Soul Reserve",
	type = {"spell/dark-mastery",2},
	require = spells_req2,
	points = 5,
	mode = "passive",
	on_learn = function(self, t)
		-- raise the max souls
		ret = {}
		self:talentTemporaryValue(ret, "max_soul", self:getTalentLevelRaw(t)*5)
		return ret
	end,
	info = function(self, t)
		return ([[Increases your capacity for storing souls by %d and adds a %d%% chance per level that when a minion dies, its soul is refunded to you.]]):
		format(self:getTalentLevelRaw(t)*5, self:getTalentLevelRaw(t)*15)
	end,
}

newTalent{
	name = "Dark Sacrifice",
	type = {"spell/dark-mastery", 3},
	require = spells_req3,
	points = 5,
	mana = 25,
	cooldown = 6,
	getPercent = function(self, t)
		return 0.90 - (self:getTalentLevelRaw(t)*0.15)
	end,
	getDamage = function(self, t)
		-- 75% at level 1, 25% at level 5
		local percent = t.getPercent(self, t)
		return self.life * percent
	end,
	action = function(self, t)
		local damage = t.getDamage(self, t)
		self.life = self.life - damage
		self:incSoul(1)
		game:playSoundNear(self, "talents/arcane")
		return true
	end,
	info = function(self, t)
		local damage = t.getDamage(self, t)
		local percent = t.getPercent(self, t)
		return ([[You tap into your own life energy to generate a soul. Drains %d%% life.]]):
		format(percent*100)
	end,
}
