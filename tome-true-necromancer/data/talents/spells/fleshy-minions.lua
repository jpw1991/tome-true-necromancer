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

local ghoul_list = {
	ghoul = {
		type = "undead", subtype = "ghoul",
		display = "z",
		body = { INVEN = 10, MAINHAND=1, OFFHAND=1, BODY=1 },
		autolevel = "ghoul",
		level_range = {1, nil}, exp_worth = 0,
		ai = "dumb_talented_simple", ai_state = { talent_in=2, ai_move="move_ghoul", },
		stats = { str=14, dex=12, mag=10, con=12 },
		rank = 2,
		size_category = 3,
		infravision = 10,
		resolvers.racial(),
		resolvers.tmasteries{ ["technique/other"]=0.3, },
		open_door = true,
		blind_immune = 1,
		see_invisible = 2,
		undead = 1,
		name = "ghoul", color=colors.TAN,
		max_life = resolvers.rngavg(90,100),
		combat_armor = 2, combat_def = 7,
		resolvers.talents{
			T_STUN={base=1, every=10, max=5},
			T_BITE_POISON={base=1, every=10, max=5},
			T_ROTTING_DISEASE={base=1, every=10, max=5},
		},
		ai_state = { talent_in=4, },
		combat = { dam=resolvers.levelup(10, 1, 1), atk=resolvers.levelup(5, 1, 1), apr=3, dammod={str=0.6} },
	},
	ghast = {
		type = "undead", subtype = "ghoul",
		display = "z",
		body = { INVEN = 10, MAINHAND=1, OFFHAND=1, BODY=1 },
		level_range = {1, nil}, exp_worth = 0,
		autolevel = "ghoul",
		ai = "dumb_talented_simple", ai_state = { talent_in=2, ai_move="move_ghoul", },
		stats = { str=14, dex=12, mag=10, con=12 },
		rank = 2,
		size_category = 3,
		infravision = 10,
		resolvers.racial(),
		resolvers.tmasteries{ ["technique/other"]=0.3, },
		open_door = true,
		blind_immune = 1,
		see_invisible = 2,
		undead = 1,
		name = "ghast", color=colors.UMBER,
		max_life = resolvers.rngavg(90,100),
		combat_armor = 2, combat_def = 7,
		resolvers.talents{
			T_STUN={base=1, every=10, max=5},
			T_BITE_POISON={base=1, every=10, max=5},
			T_ROTTING_DISEASE={base=1, every=10, max=5},
		},
		ai_state = { talent_in=4, },
		combat = { dam=resolvers.levelup(10, 1, 1), atk=resolvers.levelup(5, 1, 1), apr=3, dammod={str=0.6} },
	},
	ghoulking = {
		type = "undead", subtype = "ghoul",
		display = "z",
		body = { INVEN = 10, MAINHAND=1, OFFHAND=1, BODY=1 },
		level_range = {1, nil}, exp_worth = 0,
		autolevel = "ghoul",
		ai = "dumb_talented_simple", ai_state = { talent_in=2, ai_move="move_ghoul", },
		stats = { str=14, dex=12, mag=10, con=12 },
		rank = 2,
		size_category = 3,
		infravision = 10,
		resolvers.racial(),
		resolvers.tmasteries{ ["technique/other"]=0.3, },
		open_door = true,
		blind_immune = 1,
		see_invisible = 2,
		undead = 1,
		name = "ghoulking", color={0,0,0},
		max_life = resolvers.rngavg(90,100),
		combat_armor = 3, combat_def = 10,
		ai_state = { talent_in=2, ai_pause=20 },
		rank = 3,
		combat = { dam=resolvers.levelup(30, 1, 1.2), atk=resolvers.levelup(8, 1, 1), apr=4, dammod={str=0.6} },
		resolvers.talents{
			T_STUN={base=3, every=9, max=7},
			T_BITE_POISON={base=3, every=9, max=7},
			T_ROTTING_DISEASE={base=4, every=9, max=7},
			T_DECREPITUDE_DISEASE={base=3, every=9, max=7},
			T_WEAKNESS_DISEASE={base=3, every=9, max=7},
		},
	},
}

local mummy_list = {
	crumbling_mummy = {
		type = "undead", subtype = "mummy",
		name = "crumbling mummy", color=colors.LIGHT_RED, image="/data/gfx/shockbolt/npc/undead_mummy_greater_mummy_lord.png",
		blood_color = colors.GREY,
		display = "Z",
		combat = { dam=1, atk=1, apr=1 },
		level_range = {1, nil}, exp_worth = 0,
		body = { INVEN = 10, MAINHAND=1, OFFHAND=1, BODY=1 },
		autolevel = "warrior",
		ai = "dumb_talented_simple", ai_state = { ai_move="move_complex", talent_in=4, },
		global_speed_base = 0.8,
		stats = { str=14, dex=10, mag=10, con=14 },
		resolvers.racial("shalore"),
		open_door = true,
		cut_immune = 1,
		blind_immune = 1,
		poison_immune = 1,
		fear_immune = 1,
		see_invisible = 2,
		undead = 1,
		rank = 2,
		resolvers.inscriptions(1, "rune"),
		resolvers.tmasteries{ ["technique/2hweapon-offense"]=1, ["technique/2hweapon-cripple"]=1, },
	},
	mummy = {
		type = "undead", subtype = "mummy",
		name = "mummy", color=colors.LIGHT_RED, image="/data/gfx/shockbolt/npc/undead_mummy_greater_mummy_lord.png",
		blood_color = colors.GREY,
		display = "Z",
		combat = { dam=1, atk=1, apr=1 },
		level_range = {1, nil}, exp_worth = 0,
		body = { INVEN = 10, MAINHAND=1, OFFHAND=1, BODY=1 },
		autolevel = "warrior",
		ai = "dumb_talented_simple", ai_state = { ai_move="move_complex", talent_in=4, },
		global_speed_base = 0.8,
		stats = { str=16, dex=10, mag=10, con=16, wil=16 },
		resolvers.racial("shalore"),
		open_door = true,
		cut_immune = 1,
		blind_immune = 1,
		poison_immune = 1,
		fear_immune = 1,
		see_invisible = 2,
		life_regen = 2,
		undead = 1,
		rank = 2,
		hate_regen = 2,
		resolvers.inscriptions(1, "rune"),
		resolvers.tmasteries{ ["technique/2hweapon-offense"]=1, ["technique/2hweapon-cripple"]=1, },
		resolvers.talents{
			T_WILLFUL_STRIKE=2,
		},
	},
	well_preserved_mummy = {
		type = "undead", subtype = "mummy",
		name = "well preserved mummy", color=colors.LIGHT_RED, image="/data/gfx/shockbolt/npc/undead_mummy_greater_mummy_lord.png",
		blood_color = colors.GREY,
		display = "Z",
		combat = { dam=1, atk=1, apr=1 },
		level_range = {1, nil}, exp_worth = 0,
		body = { INVEN = 10, MAINHAND=1, OFFHAND=1, BODY=1 },
		autolevel = "warrior",
		ai = "dumb_talented_simple", ai_state = { ai_move="move_complex", talent_in=4, },
		global_speed_base = 1,
		stats = { str=18, dex=10, mag=10, con=18, cun=16, wil=20 },
		resolvers.racial("shalore"),
		open_door = true,
		cut_immune = 1,
		blind_immune = 1,
		poison_immune = 1,
		fear_immune = 1,
		see_invisible = 2,
		life_regen = 4,
		undead = 1,
		rank = 2,
		hate_regen = 2,
		resolvers.inscriptions(1, "rune"),
		resolvers.tmasteries{ ["technique/2hweapon-offense"]=1, ["technique/2hweapon-cripple"]=1, },
		resolvers.talents{
			T_CALL_SHADOWS=3,
			T_FOCUS_SHADOWS=3,
			T_SHADOW_MAGES=1,
			T_SHADOW_WARRIORS=1,
			T_WILLFUL_STRIKE=4,
		},
	}
}

local vampire_list = {
	vampire = {
		type = "undead", subtype = "vampire",
		display = "V",
		combat = { dam=resolvers.levelup(resolvers.mbonus(30, 10), 1, 0.8), atk=10, apr=9, damtype=DamageType.DRAINLIFE, dammod={str=1.9} },
		level_range = {1, nil}, exp_worth = 0,
		body = { INVEN = 10, MAINHAND=1, OFFHAND=1, BODY=1 },
		autolevel = "warriormage",
		ai = "dumb_talented_simple", ai_state = { ai_move="move_complex", talent_in=9, },
		stats = { str=12, dex=12, mag=12, con=12 },
		infravision = 10,
		life_regen = 3,
		size_category = 3,
		rank = 2,
		open_door = true,
		resolvers.inscriptions(1, "rune"),
		resolvers.sustains_at_birth(),
		resists = { [DamageType.COLD] = 80, [DamageType.NATURE] = 80, [DamageType.LIGHT] = -50,  },
		blind_immune = 1,
		confusion_immune = 1,
		see_invisible = 5,
		undead = 1,
		name = "vampire", color=colors.SLATE, image = "npc/vampire.png",
		desc=[[It is a humanoid with an aura of power. You notice a sharp set of front teeth.]],
		max_life = resolvers.rngavg(70,80),
		combat_armor = 9, combat_def = 6,
		resolvers.talents{ T_STUN={base=1, every=7, max=5}, T_BLUR_SIGHT={base=1, every=7, max=5}, T_ROTTING_DISEASE={base=1, every=7, max=5}, },
	},
	m_vampire = {
		type = "undead", subtype = "vampire",
		display = "V",
		combat = { dam=resolvers.levelup(resolvers.mbonus(30, 10), 1, 0.8), atk=10, apr=9, damtype=DamageType.DRAINLIFE, dammod={str=1.9} },
		level_range = {1, nil}, exp_worth = 0,
		body = { INVEN = 10, MAINHAND=1, OFFHAND=1, BODY=1 },
		autolevel = "warriormage",
		ai = "dumb_talented_simple", ai_state = { ai_move="move_complex", talent_in=9, },
		stats = { str=12, dex=12, mag=12, con=12 },
		infravision = 10,
		life_regen = 3,
		size_category = 3,
		rank = 2,
		open_door = true,
		resolvers.inscriptions(1, "rune"),
		resolvers.sustains_at_birth(),
		resists = { [DamageType.COLD] = 80, [DamageType.NATURE] = 80, [DamageType.LIGHT] = -50,  },
		blind_immune = 1,
		confusion_immune = 1,
		see_invisible = 5,
		undead = 1,
		name = "master vampire", color=colors.GREEN, image = "npc/master_vampire.png",
		resolvers.nice_tile{image="invis.png", add_mos = {{image="npc/master_vampire.png", display_h=2, display_y=-1}}},
		desc=[[It is a humanoid form dressed in robes. Power emanates from its chilling frame.]],
		max_life = resolvers.rngavg(80,90),
		combat_armor = 10, combat_def = 8,
		ai = "dumb_talented_simple", ai_state = { talent_in=1, },
		resolvers.talents{ T_STUN={base=1, every=7, max=5}, T_BLUR_SIGHT={base=2, every=7, max=5}, T_PHANTASMAL_SHIELD={base=1, every=7, max=5}, T_ROTTING_DISEASE={base=2, every=7, max=5}, },
	},
}

local golem_list = {
	bone_giant = {
		type = "undead", subtype = "giant",
		blood_color = colors.GREY,
		display = "K",
		combat = { dam=resolvers.levelup(resolvers.mbonus(45, 20), 1, 1), atk=15, apr=10, dammod={str=0.8} },
		body = { INVEN = 10, MAINHAND=1, OFFHAND=1, BODY=1 },
		infravision = 10,
		life_rating = 12,
		max_stamina = 90,
		rank = 2,
		size_category = 4,
		movement_speed = 1.5,
		autolevel = "warrior",
		ai = "dumb_talented_simple", ai_state = { ai_move="move_complex", talent_in=2, },
		stats = { str=20, dex=12, mag=16, con=16 },
		resists = { [DamageType.PHYSICAL] = 20, [DamageType.BLIGHT] = 20, [DamageType.COLD] = 50, },
		open_door = 1,
		no_breath = 1,
		confusion_immune = 1,
		poison_immune = 1,
		blind_immune = 1,
		fear_immune = 1,
		stun_immune = 1,
		see_invisible = resolvers.mbonus(15, 5),
		undead = 1,
		name = "bone giant", color=colors.WHITE,
		desc = [[A towering creature, made from the bones of dozens of dead bodies. It is covered by an unholy aura.]],
		resolvers.nice_tile{image="invis.png", add_mos = {{image="npc/undead_giant_bone_giant.png", display_h=2, display_y=-1}}},
		max_life = resolvers.rngavg(100,120),
		level_range = {1, nil}, exp_worth = 0,
		combat_armor = 20, combat_def = 0,
		on_melee_hit = {[DamageType.BLIGHT]=resolvers.mbonus(15, 5)},
		melee_project = {[DamageType.BLIGHT]=resolvers.mbonus(15, 5)},
		resolvers.talents{ T_BONE_ARMOUR={base=3, every=10, max=5}, T_STUN={base=3, every=10, max=5}, },
	},
	h_bone_giant = {
		type = "undead", subtype = "giant",
		blood_color = colors.GREY,
		display = "K",
		combat = { dam=resolvers.levelup(resolvers.mbonus(45, 20), 1, 1), atk=15, apr=10, dammod={str=0.8} },
		body = { INVEN = 10, MAINHAND=1, OFFHAND=1, BODY=1 },
		infravision = 10,
		life_rating = 12,
		max_stamina = 90,
		rank = 2,
		size_category = 4,
		movement_speed = 1.5,
		autolevel = "warrior",
		ai = "dumb_talented_simple", ai_state = { ai_move="move_complex", talent_in=2, },
		stats = { str=20, dex=12, mag=16, con=16 },
		resists = { [DamageType.PHYSICAL] = 20, [DamageType.BLIGHT] = 20, [DamageType.COLD] = 50, },
		open_door = 1,
		no_breath = 1,
		confusion_immune = 1,
		poison_immune = 1,
		blind_immune = 1,
		fear_immune = 1,
		stun_immune = 1,
		see_invisible = resolvers.mbonus(15, 5),
		undead = 1,
		name = "heavy bone giant", color=colors.RED,
		desc = [[A towering creature, made from the bones of hundreds of dead bodies. It is covered by an unholy aura.]],
		resolvers.nice_tile{image="invis.png", add_mos = {{image="npc/undead_giant_heavy_bone_giant.png", display_h=2, display_y=-1}}},
		level_range = {1, nil}, exp_worth = 0,
		max_life = resolvers.rngavg(100,120),
		combat_armor = 20, combat_def = 0,
		on_melee_hit = {[DamageType.BLIGHT]=resolvers.mbonus(15, 5)},
		melee_project = {[DamageType.BLIGHT]=resolvers.mbonus(15, 5)},
		resolvers.talents{ T_BONE_ARMOUR={base=3, every=10, max=5}, T_THROW_BONES={base=4, every=10, max=7}, T_STUN={base=3, every=10, max=5}, },
	},
	e_bone_giant = {
		type = "undead", subtype = "giant",
		blood_color = colors.GREY,
		display = "K",
		combat = { dam=resolvers.levelup(resolvers.mbonus(45, 20), 1, 1), atk=15, apr=10, dammod={str=0.8} },
		body = { INVEN = 10, MAINHAND=1, OFFHAND=1, BODY=1 },
		infravision = 10,
		life_rating = 12,
		max_stamina = 90,
		rank = 2,
		size_category = 4,
		movement_speed = 1.5,
		autolevel = "warrior",
		ai = "dumb_talented_simple", ai_state = { ai_move="move_complex", talent_in=2, },
		stats = { str=20, dex=12, mag=16, con=16 },
		resists = { [DamageType.PHYSICAL] = 20, [DamageType.BLIGHT] = 20, [DamageType.COLD] = 50, },
		open_door = 1,
		no_breath = 1,
		confusion_immune = 1,
		poison_immune = 1,
		blind_immune = 1,
		fear_immune = 1,
		stun_immune = 1,
		see_invisible = resolvers.mbonus(15, 5),
		undead = 1,
		name = "eternal bone giant", color=colors.GREY,
		desc = [[A towering creature, made from the bones of hundreds of dead bodies. It is covered by an unholy aura.]],
		resolvers.nice_tile{image="invis.png", add_mos = {{image="npc/undead_giant_eternal_bone_giant.png", display_h=2, display_y=-1}}},
		level_range = {1, nil}, exp_worth = 0,
		max_life = resolvers.rngavg(100,120),
		combat_armor = 40, combat_def = 20,
		on_melee_hit = {[DamageType.BLIGHT]=resolvers.mbonus(15, 5)},
		melee_project = {[DamageType.BLIGHT]=resolvers.mbonus(15, 5)},
		autolevel = "warriormage",
		resists = {all = 50},
		resolvers.talents{ T_BONE_ARMOUR={base=5, every=10, max=7}, T_STUN={base=3, every=10, max=5}, T_SKELETON_REASSEMBLE=5, },
	},
	r_bone_giant = {
		type = "undead", subtype = "giant",
		blood_color = colors.GREY,
		display = "K",
		combat = { dam=resolvers.levelup(resolvers.mbonus(45, 20), 1, 1), atk=15, apr=10, dammod={str=0.8} },
		body = { INVEN = 10, MAINHAND=1, OFFHAND=1, BODY=1 },
		infravision = 10,
		life_rating = 12,
		max_stamina = 90,
		rank = 2,
		size_category = 4,
		movement_speed = 1.5,
		autolevel = "warrior",
		ai = "dumb_talented_simple", ai_state = { ai_move="move_complex", talent_in=2, },
		stats = { str=20, dex=12, mag=16, con=16 },
		resists = { [DamageType.PHYSICAL] = 20, [DamageType.BLIGHT] = 20, [DamageType.COLD] = 50, },
		open_door = 1,
		no_breath = 1,
		confusion_immune = 1,
		poison_immune = 1,
		blind_immune = 1,
		fear_immune = 1,
		stun_immune = 1,
		see_invisible = resolvers.mbonus(15, 5),
		undead = 1,
		name = "runed bone giant", color=colors.RED,
		desc = [[A towering creature, made from the bones of hundreds of dead bodies, rune-etched and infused with hateful sorceries.]],
		resolvers.nice_tile{image="invis.png", add_mos = {{image="npc/undead_giant_runed_bone_giant.png", display_h=2, display_y=-1}}},
		level_range = {1, nil}, exp_worth = 0,
		rank = 3,
		max_life = resolvers.rngavg(100,120),
		combat_armor = 20, combat_def = 40,
		melee_project = {[DamageType.BLIGHT]=resolvers.mbonus(15, 15)},
		autolevel = "warriormage",
		resists = {all = 30},
		resolvers.talents{
			T_BONE_ARMOUR={base=5, every=10, max=7},
			T_STUN={base=3, every=10, max=5},
			T_SKELETON_REASSEMBLE=5,
			T_ARCANE_POWER={base=4, every=5, max = 8},
			T_MANATHRUST={base=4, every=5, max = 10},
			T_MANAFLOW={base=5, every=5, max = 10},
			T_STRIKE={base=4, every=5, max = 12},
			T_INNER_POWER={base=4, every=5, max = 10},
			T_EARTHEN_MISSILES={base=5, every=5, max = 10},
		},
		resolvers.sustains_at_birth(),
	},
}

local ghoul_order = {"ghoul", "ghast", "ghoulking"} -- Sets listing order
local vampire_order = {"vampire", "m_vampire"}
local mummy_order = {"crumbling_mummy", "mummy", "well_preserved_mummy"}

local function getGhoulChances(self)
  local quality = math.floor(self:getTalentLevel(self.T_FLESHY_MASTERY))
	if quality == 2 then
		return { ghoul=50, ghast=50, ghoulking=0 }
	elseif quality == 3 then
		return { ghoul=25, ghast=50, ghoulking=25 }
	elseif quality == 4 then
		return { ghoul=25, ghast=25, ghoulking=50 }
	elseif quality == 5 then
		return { ghoul=15, ghast=20, ghoulking=65 }
	elseif quality == 6 then
		return { ghoul=10, ghast=10, ghoulking=80 }
	else
		-- level 1 or 0
		return { ghoul=80, ghast=20, ghoulking=0 }
	end
end

local function getVampireChances(self)
	return { vampire=50, m_vampire=50 }
end

local function getMummyChances(self)
  local quality = math.floor(self:getTalentLevel(self.T_FLESHY_MASTERY))
	if quality == 2 then
		return { crumbling_mummy=50, mummy=50, well_preserved_mummy=0 }
	elseif quality == 3 then
		return { crumbling_mummy=25, mummy=50, well_preserved_mummy=25 }
	elseif quality == 4 then
		return { crumbling_mummy=25, mummy=25, well_preserved_mummy=50 }
	elseif quality == 5 then
		return { crumbling_mummy=15, mummy=20, well_preserved_mummy=65 }
	elseif quality == 6 then
		return { crumbling_mummy=0, mummy=0, well_preserved_mummy=100 }
	else
		-- level 1 or 0
		return { crumbling_mummy=80, mummy=20, well_preserved_mummy=0 }
	end
end

local function summonGhoul(self, lev)
	local chances = getGhoulChances(self)
	local pick = rng.float(0,100)
	local tot, m = 0
	for k, e in pairs(chances) do
		tot = tot + e
		if tot > pick then
			m = k
			break
		end
	end
	m = require("mod.class.NPC").new(ghoul_list[m])
	m.necrotic_minion = true
	m.minion_type = "ghoul"
	return m
end

local function summonVampire(self, lev)
	local chances = getVampireChances(self)
	local pick = rng.float(0,100)
	local tot, m = 0
	for k, e in pairs(chances) do
		tot = tot + e
		if tot > pick then
			m = k
			break
		end
	end
	m = require("mod.class.NPC").new(vampire_list[m])
	m.necrotic_minion = true
	m.minion_type = "vampire"
	return m
end

local function summonMummy(self, lev)
	local chances = getMummyChances(self)
	local pick = rng.float(0,100)
	local tot, m = 0
	for k, e in pairs(chances) do
		tot = tot + e
		if tot > pick then
			m = k
			break
		end
	end
	m = require("mod.class.NPC").new(mummy_list[m])
	m.necrotic_minion = true
	m.minion_type = "mummy"
	return m
end

newTalent{
	name = "Summon Ghouls",
	type = {"spell/fleshy-minions",1},
	require = spells_req1,
	points = 5,
	fake_ressource = true,
	mana = 10,
	cooldown = 14,
	tactical = { ATTACK = 10 },
	requires_target = true,
	range = 0,
	radius = function(self, t)
		--local aura = self:getTalentFromId(self.T_TRUE_NECROTIC_AURA)
		--return aura.getRadius(self, aura)
		return 2 + self:getTalentLevelRaw(self.T_SUMMON_GHOULS)
	end,
	target = function(self, t)
		return {type="cone", range=self:getTalentRange(t), radius=self:getTalentRadius(t), selffire=false, talent=t}
	end,
	getMax = function(self, t)
		return math.floor(self:getTalentLevel(t))
	end,
	getLevel = function(self, t)
		return math.floor(self:combatScale(self:getTalentLevel(t), -6, 0.9, 2, 5)) + math.floor(self:getTalentLevel(self.T_MINION_STRENGTH))
	end, -- -6 @ 1, +2 @ 5, +5 @ 8 + the minion strength
	MinionChancesDesc = function(self)
		local c = getGhoulChances(self)
		local chancelist = tstring({})
		for i, k in ipairs(ghoul_order) do
			if c[k] then
				chancelist:add(true,ghoul_list[k].name:capitalize(),(": %d%%"):format(c[k]))
			end
		end
		return chancelist:toString()
	end,
	action = function(self, t)
		-- only allow the summon if we haven't exceeded the limit
		local nb = t.getMax(self, t) - trueNecroGetNbSummon(self, "ghoul")
		if trueNecroGetNbSummon(self,"ghoul") < nb then
			local lev = t.getLevel(self, t)

			-- Summon minions in a cone
			local tg = self:getTalentTarget(t)
			local x, y = self:getTarget(tg)
			if not x or not y then return nil end
			local possible_spots = {}
			self:project(tg, x, y, function(px, py)
				if not game.level.map:checkAllEntities(px, py, "block_move") then
					possible_spots[#possible_spots+1] = {x=px, y=py}
				end
			end)
			local use_ressource = not self:attr("zero_resource_cost") and not self:attr("force_talent_ignore_ressources")
			for i = 1, nb do
				local minion = summonGhoul(self, self:getTalentLevel(t))
				local pos = rng.tableRemove(possible_spots)
				if minion and pos then
					if use_ressource then self:incSoul(-1) end
					necroSetupSummon(self, minion, pos.x, pos.y, lev)
				end
		  end

			local empower = necroEssenceDead(self)
			if empower then empower() end

			if use_ressource then self:incMana(-util.getval(t.mana, self, t) * (100 + 2 * self:combatFatigue()) / 100) end
			game:playSoundNear(self, "talents/spell_generic2")
	  end

		return true
	end,
	info = function(self, t)
		local nb = t.getMax(self, t)
		local lev = t.getLevel(self, t)
		local mm = self:knowTalent(self.T_FLESHY_MASTERY) and " (Minion Strength effects included)" or ""
		return ([[Expend the captured souls of your enemies to raise a pack of ghouls to command. You can control up to %d ghouls. The minions will be raised within a cone with a range of %d.
		The minion level is your level %+d.
		Each minion has a chance to be%s:%s]]):
		format(nb, self:getTalentRadius(t), lev, mm, t.MinionChancesDesc(self, t))
	end,
}

--[[
newTalent{
	name = "Summon Vampires",
	type = {"spell/fleshy-minions",2},
	require = spells_req2,
	points = 5,
	fake_ressource = true,
	mana = 20,
	cooldown = 14,
	tactical = { ATTACK = 10 },
	requires_target = true,
	range = 0,
	radius = function(self, t)
		--local aura = self:getTalentFromId(self.T_TRUE_NECROTIC_AURA)
		--return aura.getRadius(self, aura)
		return 2 + self:getTalentLevelRaw(self.T_SUMMON_VAMPIRES)
	end,
	target = function(self, t)
		return {type="cone", range=self:getTalentRange(t), radius=self:getTalentRadius(t), selffire=false, talent=t}
	end,
	getMax = function(self, t)
		return math.floor(self:getTalentLevel(t))
	end,
	getLevel = function(self, t)
		return math.floor(self:combatScale(self:getTalentLevel(t), -6, 0.9, 2, 5)) + math.floor(self:getTalentLevel(self.T_MINION_STRENGTH))
	end, -- -6 @ 1, +2 @ 5, +5 @ 8 + the minion strength
	MinionChancesDesc = function(self)
		local c = getVampireChances(self)
		local chancelist = tstring({})
		for i, k in ipairs(vampire_order) do
			if c[k] then
				chancelist:add(true,vampire_list[k].name:capitalize(),(": %d%%"):format(c[k]))
			end
		end
		return chancelist:toString()
	end,
	action = function(self, t)
		-- only allow the summon if we haven't exceeded the limit
		local nb = t.getMax(self, t) - trueNecroGetNbSummon(self, "vampire")
		if trueNecroGetNbSummon(self,"vampire") < nb then
			local lev = t.getLevel(self, t)

			-- Summon minions in a cone
			local tg = self:getTalentTarget(t)
			local x, y = self:getTarget(tg)
			if not x or not y then return nil end
			local possible_spots = {}
			self:project(tg, x, y, function(px, py)
				if not game.level.map:checkAllEntities(px, py, "block_move") then
					possible_spots[#possible_spots+1] = {x=px, y=py}
				end
			end)
			local use_ressource = not self:attr("zero_resource_cost") and not self:attr("force_talent_ignore_ressources")
			for i = 1, nb do
				local minion = summonVampire(self, self:getTalentLevel(t))
				local pos = rng.tableRemove(possible_spots)
				if minion and pos then
					if use_ressource then self:incSoul(-1) end
					necroSetupSummon(self, minion, pos.x, pos.y, lev)
				end
		  end

			local empower = necroEssenceDead(self)
			if empower then empower() end

			if use_ressource then self:incMana(-util.getval(t.mana, self, t) * (100 + 2 * self:combatFatigue()) / 100) end
			game:playSoundNear(self, "talents/spell_generic2")
	  end

		return true
	end,
	info = function(self, t)
		local nb = t.getMax(self, t)
		local lev = t.getLevel(self, t)
		local mm = self:knowTalent(self.T_FLESHY_MASTERY) and " (Minion Strength effects included)" or ""
		return ([[Expend the captured souls of your enemies to raise a group of vampires to command. You can control up to %d vampires. The minions will be raised within a cone with a range of %d.
		The minion level is your level %+d.
		Each minion has a chance to be%s:%s]--]):
		format(nb, self:getTalentRadius(t), lev, mm, t.MinionChancesDesc(self, t))
	end,
}--]]

newTalent{
	name = "Bone Golem",
	type = {"spell/fleshy-minions",2},
	require = spells_req2,
	points = 5,
	mana = 90,
	cooldown = 25,
	tactical = { ATTACK = 10 },
	requires_target = true,
	getMax = function(self, t)
		return math.floor(self:getTalentLevel(t))/2
	end,
	getLevel = function(self, t) return math.floor(self:combatScale(self:getTalentLevel(t), -6, 0.9, 2, 5)) end, -- -6 @ 1, +2 @ 5, +5 @ 8
	action = function(self, t)
		local nb = t.getMax(self, t) - trueNecroGetNbSummon(self, "golem")
		if trueNecroGetNbSummon(self,"golem") < nb then
			local kind = ({"bone_giant","bone_giant","h_bone_giant","h_bone_giant","e_bone_giant"})[util.bound(math.floor(self:getTalentLevel(t)), 1, 5)]
			if self:getTalentLevel(t) >= 6 and rng.percent(20) then kind = "r_bone_giant" end

			local minion = require("mod.class.NPC").new(golem_list[kind])
			minion.necrotic_minion = true
			minion.minion_type = "golem"
			local x, y = util.findFreeGrid(self.x, self.y, 5, true, {[Map.ACTOR]=true})
			if minion and x and y then
				local lev = t.getLevel(self, t)
				necroSetupSummon(self, minion, x, y, lev, true)
			end
		end

		game:playSoundNear(self, "talents/spell_generic2")
		return true
	end,
	info = function(self, t)
		return ([[You collect a bunch of bones together and imbue them with the rage from your lifetime of suffering.
		At level 1, it makes a bone giant.
		At level 3, it makes a heavy bone giant.
		At level 5, it makes an eternal bone giant.
		At level 6, it has a 20%% chance to produce a runed bone giant.
		A max of %s can be active at any time.]]):
		format(t.getMax(self, t))
	end,
}

newTalent{
	name = "Summon Mummies",
	type = {"spell/fleshy-minions",3},
	require = spells_req3,
	points = 5,
	fake_ressource = true,
	mana = 20,
	cooldown = 14,
	tactical = { ATTACK = 10 },
	requires_target = true,
	range = 0,
	radius = function(self, t)
		--local aura = self:getTalentFromId(self.T_TRUE_NECROTIC_AURA)
		--return aura.getRadius(self, aura)
		return 2 + self:getTalentLevelRaw(self.T_SUMMON_MUMMIES)
	end,
	target = function(self, t)
		return {type="cone", range=self:getTalentRange(t), radius=self:getTalentRadius(t), selffire=false, talent=t}
	end,
	getMax = function(self, t)
		return math.floor(self:getTalentLevel(t))
	end,
	getLevel = function(self, t)
		return math.floor(self:combatScale(self:getTalentLevel(t), -6, 0.9, 2, 5)) + math.floor(self:getTalentLevel(self.T_MINION_STRENGTH))
	end, -- -6 @ 1, +2 @ 5, +5 @ 8 + the minion strength
	MinionChancesDesc = function(self)
		local c = getMummyChances(self)
		local chancelist = tstring({})
		for i, k in ipairs(mummy_order) do
			if c[k] then
				chancelist:add(true,mummy_list[k].name:capitalize(),(": %d%%"):format(c[k]))
			end
		end
		return chancelist:toString()
	end,
	action = function(self, t)
		-- only allow the summon if we haven't exceeded the limit
		local nb = t.getMax(self, t) - trueNecroGetNbSummon(self, "mummy")
		if trueNecroGetNbSummon(self,"mummy") < nb then
			local lev = t.getLevel(self, t)

			-- Summon minions in a cone
			local tg = self:getTalentTarget(t)
			local x, y = self:getTarget(tg)
			if not x or not y then return nil end
			local possible_spots = {}
			self:project(tg, x, y, function(px, py)
				if not game.level.map:checkAllEntities(px, py, "block_move") then
					possible_spots[#possible_spots+1] = {x=px, y=py}
				end
			end)
			local use_ressource = not self:attr("zero_resource_cost") and not self:attr("force_talent_ignore_ressources")
			for i = 1, nb do
				local minion = summonMummy(self, self:getTalentLevel(t))
				local pos = rng.tableRemove(possible_spots)
				if minion and pos then
					if use_ressource then self:incSoul(-1) end
					necroSetupSummon(self, minion, pos.x, pos.y, lev)
				end
		  end

			local empower = necroEssenceDead(self)
			if empower then empower() end

			if use_ressource then self:incMana(-util.getval(t.mana, self, t) * (100 + 2 * self:combatFatigue()) / 100) end
			game:playSoundNear(self, "talents/spell_generic2")
	  end

		return true
	end,
	info = function(self, t)
		local nb = t.getMax(self, t)
		local lev = t.getLevel(self, t)
		local mm = self:knowTalent(self.T_FLESHY_MASTERY) and " (Minion Strength effects included)" or ""
		return ([[Expend the captured souls of your enemies to raise a group of mummies to command. You can control up to %d mummies. The minions will be raised within a cone with a range of %d.
		The minion level is your level %+d.
		Each minion has a chance to be%s:%s]]):
		format(nb, self:getTalentRadius(t), lev, mm, t.MinionChancesDesc(self, t))
	end,
}

newTalent{
	name = "Fleshy Mastery",
	type = {"spell/fleshy-minions",4},
	require = spells_req4,
	points = 5,
	mode = "passive",
	info = function(self, t)
		return ([[Increases the quality of your minions.]])
	end,
}
