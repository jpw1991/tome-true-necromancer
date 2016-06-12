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
	name = "Devour Soul",
	type = {"spell/soul-manipulation",1},
	require = spells_req1,
	points = 5,
	soul = 1,
	cooldown = 10,
	tactical = { HEAL = 1, MANA = 1 },
	getHeal = function(self, t) return (40 + self:combatTalentSpellDamage(t, 10, 520)) * (necroEssenceDead(self, true) and 1.5 or 1) end,
	is_heal = true,
	action = function(self, t)
		self:attr("allow_on_heal", 1)
		self:heal(self:spellCrit(t.getHeal(self, t)), self)
		self:attr("allow_on_heal", -1)
		self:incMana(self:spellCrit(t.getHeal(self, t)) / 3, self)
		if core.shader.active(4) then
			self:addParticles(Particles.new("shader_shield_temp", 1, {toback=true , size_factor=1.5, y=-0.3, img="healdark", life=25}, {type="healing", time_factor=6000, beamsCount=15, noup=2.0, beamColor1={0xcb/255, 0xcb/255, 0xcb/255, 1}, beamColor2={0x35/255, 0x35/255, 0x35/255, 1}}))
			self:addParticles(Particles.new("shader_shield_temp", 1, {toback=false, size_factor=1.5, y=-0.3, img="healdark", life=25}, {type="healing", time_factor=6000, beamsCount=15, noup=1.0, beamColor1={0xcb/255, 0xcb/255, 0xcb/255, 1}, beamColor2={0x35/255, 0x35/255, 0x35/255, 1}}))
		end
		game:playSoundNear(self, "talents/heal")
		if necroEssenceDead(self, true) then necroEssenceDead(self)() end
		return true
	end,
	info = function(self, t)
		local heal = t.getHeal(self, t)
		return ([[Crush and consume one of your captured souls, healing you for %d life and restoring %d mana.
		The life and mana healed will increase with your Spellpower.]]):
		format(heal, heal / 3)
	end,
}

newTalent{
	name = "Rune: Shielding",
	type = {"spell/soul-manipulation", 2},
	require = spells_req2,
	points = 5,
	is_spell = true,
	allow_autocast = true,
	no_energy = true,
	tactical = { DEFEND = 2 },
	on_pre_use = function(self, t)
		return not self:hasEffect(self.EFF_DAMAGE_SHIELD)
	end,
	action = function(self, t)
		local data = self:getInscriptionData(t.short_name)
		self:setEffect(self.EFF_DAMAGE_SHIELD, data.dur, {power=data.power + data.inc_stat})
		return true
	end,
	info = function(self, t)
		local data = self:getInscriptionData(t.short_name)
		return ([[Activate the rune to create a protective shield absorbing at most %d damage for %d turns.]]):format(data.power + data.inc_stat, data.dur)
	end,
	short_info = function(self, t)
		local data = self:getInscriptionData(t.short_name)
		return ([[absorb %d for %d turns]]):format(data.power + data.inc_stat, data.dur)
	end,
}
