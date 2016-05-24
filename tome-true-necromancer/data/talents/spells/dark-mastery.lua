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

--local _M = loadPrevious(...)

newTalent{
	name = "True Necrotic Aura", image = "talents/aura_mastery.png",
	type = {"spell/other", 1},
	points = 1,
	mode = "sustained",
	--mode = "passive",
	autolearn_talent = "T_SOUL_POOL",
	cooldown = 10,
	sustain_mana = 10,
	no_unlearn_last = true,
	tactical = { BUFF = 2 },
	die_speach = function(self, t)
		if rng.percent(90) then return end
		self:doEmote(rng.table{
			"Noooooo!",
			"Save me, Master, save meeee---",
			"Aaaauuuggghhh!",
			"Did I do good?",
			"Bwuh? Nwaaah!",
			"Why, Master, whyyyyy---?",
			"I thought you loved me! I thought-",
			"For Master's glory!",
			"Bye... bye....",
			"We love you, Master!",
			"EeeeeeeaaaAAAAAUUUUUGGGGGHHHHH!!!!",
			"The pain, the PAAAAAIN!",
			"Please, no, nooo--",
			"Unlife no more for this dead matter, the time comes for my flesh to splatter.",
			"You gave back life, you gave back dreams, but now I'm bursting at the seams...",
			"Remember meeeee!",
			"My tummy hurts...",
			"Whu..?",
			"Ahahahahaha!",
			"Me go boom, me go BOOM!",
			"Grave circumstances, Master....",
			"I see the light.. I see, oh.. just a wisp....",
			"Master, wait... I thought I saw a....Master? ..",
			"I'm not.. so sure my spine is supposed to bend this way....",
			"I told you I could Dash 100 yards and back in time! You owe me 10 gol....",
		}, 40)
	end,
	getDecay = function(self, t) return math.max(3, 10 - self:getTalentLevelRaw(self.T_TRUE_AURA_MASTERY)) end,
	getRadius = function(self, t) return 2 + self:callTalent(self.T_TRUE_AURA_MASTERY, "getbonusRadius") end,
	activate = function(self, t)
		local radius = t.getRadius(self, t)
		local decay = t.getDecay(self, t)
		game:playSoundNear(self, "talents/spell_generic2")
		local ret = {
			rad = self:addTemporaryValue("true_necrotic_aura_radius", radius),
			decay = self:addTemporaryValue("true_necrotic_aura_decay", decay),
			retch = self:addTemporaryValue("retch_heal", 1),
			particle = self:addParticles(Particles.new("necrotic-aura", 1, {radius=radius})),
			particle2 = self:addParticles(Particles.new("circle", 1, {oversize=0.7, a=75, appear=8, speed=8, img="necro_aura", radius=radius})),
		}
		return ret
	end,
	deactivate = function(self, t, p)
		self:removeParticles(p.particle)
		self:removeParticles(p.particle2)
		self:removeTemporaryValue("retch_heal", p.retch)
		self:removeTemporaryValue("true_necrotic_aura_radius", p.rad)
		self:removeTemporaryValue("true_necrotic_aura_decay", p.decay)
		return true
	end,
	info = function(self, t)
		local radius = t.getRadius(self, t)
		local decay = t.getDecay(self, t)
		return ([[Emits a necrotic aura, sustaining your undead minions in a radius of %d. Minions outside the radius will lose %d%% life per turn.
		Any creature you or your minions kill within your aura will be absorbed as a soul that can be used to raise minions.
		Retch from your ghouls will also heal you, even if you are not undead. Minions that die inside the aura have a 12%% [2-24%%, 3-36%%, 4-48%%, 5-60%%] chance of returning a soul to you.]]):
		format(radius, decay)
	end,
}

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
	name = "True Aura Mastery",
	type = {"spell/dark-mastery",2},
	require = spells_req2,
	points = 5,
	mode = "passive",
	getbonusRadius = function(self, t) return math.floor(self:combatTalentScale(t, 1, 5)) end,
	on_learn = function(self, t)
		self:forceUseTalent(self.T_TRUE_NECROTIC_AURA, {ignore_energy=true, ignore_cd=true, no_equilibrium_fail=true, no_paradox_fail=true})
		self:forceUseTalent(self.T_TRUE_NECROTIC_AURA, {ignore_energy=true, ignore_cd=true, no_equilibrium_fail=true, no_paradox_fail=true})
	end,
	on_unlearn = function(self, t)
		self:forceUseTalent(self.T_TRUE_NECROTIC_AURA, {ignore_energy=true, ignore_cd=true, no_equilibrium_fail=true, no_paradox_fail=true})
		self:forceUseTalent(self.T_TRUE_NECROTIC_AURA, {ignore_energy=true, ignore_cd=true, no_equilibrium_fail=true, no_paradox_fail=true})
	end,
	info = function(self, t)
		return ([[Your dark power radiates further as you grow stronger. Increases the radius of your necrotic aura by %d, and reduces the decay rate of your minions outside the aura by %d%%. At max level your minions will not decay, even without the aura active.]]):
		format(math.floor(t.getbonusRadius(self, t)), math.min(7, self:getTalentLevelRaw(t)))
	end,
}

newTalent{
	name = "Soul Reserve",
	type = {"spell/dark-mastery",3},
	require = spells_req3,
	points = 5,
	mode = "passive",
	on_learn = function(self, t)
		-- raise the max souls
		ret = {}
		self:talentTemporaryValue(ret, "max_soul", self:getTalentLevelRaw(t)*5)
		return ret
	end,
	info = function(self, t)
		return ([[Increases your capacity for storing souls by %%d.]]):
		format(self:getTalentLevelRaw(t)*5)
	end,
}

--[[
newTalent{
	name = "True Surge of Undeath",
	type = {"spell/dark-mastery",3},
	require = spells_req3,
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
		The effects will increase with your Spellpower.]REMOVEME]):
		format(t.getPower(self, t), t.getAPR(self, t), t.getCrit(self, t))
	end,
}

newTalent{
	name = "True Dark Empathy",
	type = {"spell/dark-mastery",4},
	require = spells_req4,
	points = 5,
	mode = "passive",
	getPerc = function(self, t) return self:combatTalentSpellDamage(t, 15, 80) end,
	info = function(self, t)
		return ([[You share your powers with your minions, granting them %d%% of your resistances and saves.
		In addition all damage done by your minions to you is reduced by %d%%.
		The effect will increase with your Spellpower.]REMOVEME]):
		format(t.getPerc(self, t), self:getTalentLevelRaw(t) * 20)
	end,
}
--]]

--return _M
