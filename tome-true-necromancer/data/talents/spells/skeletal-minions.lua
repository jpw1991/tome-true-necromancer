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

local skeleton_warrior_list = {
	d_skel_warrior = {
		type = "undead", subtype = "skeleton",
		name = "degenerated skeleton warrior", color=colors.WHITE, image="npc/degenerated_skeleton_warrior.png",
		blood_color = colors.GREY,
		display = "s",
		combat = { dam=1, atk=1, apr=1 },
		level_range = {1, nil}, exp_worth = 0,
		body = { INVEN = 10, MAINHAND=1, OFFHAND=1, BODY=1, QUIVER=1 },
		infravision = 10,
		rank = 2,
		size_category = 3,
		autolevel = "warrior",
		ai = "dumb_talented_simple", ai_state = { ai_move="move_complex", talent_in=4, },
		stats = { str=14, dex=12, mag=10, con=12 },
		resolvers.racial(),
		resolvers.tmasteries{ ["technique/other"]=0.3, ["technique/2hweapon-offense"]=0.3, ["technique/2hweapon-cripple"]=0.3 },
		open_door = true,
		cut_immune = 1,
		blind_immune = 1,
		poison_immune = 1,
		fear_immune = 1,
		see_invisible = 2,
		undead = 1,
		rarity = 1,

		resolvers.equip{ {type="weapon", subtype="greatsword", autoreq=true} },
		max_life = resolvers.rngavg(40,50),
		combat_armor = 5, combat_def = 1,
	},
	skel_warrior = {
		type = "undead", subtype = "skeleton",
		name = "skeleton warrior", color=colors.SLATE, image="npc/skeleton_warrior.png",
		blood_color = colors.GREY,
		display = "s", color=colors.SLATE,
		combat = { dam=1, atk=1, apr=1 },
		level_range = {1, nil}, exp_worth = 0,
		body = { INVEN = 10, MAINHAND=1, OFFHAND=1, BODY=1, QUIVER=1 },
		infravision = 10,
		rank = 2,
		size_category = 3,
		autolevel = "warrior",
		ai = "dumb_talented_simple", ai_state = { ai_move="move_complex", talent_in=4, },
		stats = { str=14, dex=12, mag=10, con=12 },
		resolvers.racial(),
		resolvers.tmasteries{ ["technique/other"]=0.3, ["technique/2hweapon-offense"]=0.3, ["technique/2hweapon-cripple"]=0.3 },
		open_door = true,
		cut_immune = 1,
		blind_immune = 1,
		fear_immune = 1,
		see_invisible = 2,
		poison_immune = 1,
		undead = 1,
		rarity = 1,

		max_life = resolvers.rngavg(90,100),
		combat_armor = 5, combat_def = 1,
		resolvers.equip{ {type="weapon", subtype="greatsword", autoreq=true} },
		resolvers.talents{ T_STUNNING_BLOW={base=1, every=7, max=5}, T_WEAPON_COMBAT={base=1, every=7, max=10}, T_WEAPONS_MASTERY={base=1, every=7, max=10}, },
		ai_state = { talent_in=1, },
	},
	a_skel_warrior = {
		type = "undead", subtype = "skeleton",
		name = "armoured skeleton warrior", color=colors.STEEL_BLUE, image="npc/armored_skeleton_warrior.png",
		blood_color = colors.GREY,
		display = "s", color=colors.STEEL_BLUE,
		combat = { dam=1, atk=1, apr=1 },
		level_range = {1, nil}, exp_worth = 0,
		body = { INVEN = 10, MAINHAND=1, OFFHAND=1, BODY=1, QUIVER=1 },
		infravision = 10,
		rank = 2,
		size_category = 3,
		autolevel = "warrior",
		ai = "dumb_talented_simple", ai_state = { ai_move="move_complex", talent_in=4, },
		stats = { str=14, dex=12, mag=10, con=12 },
		resolvers.racial(),
		resolvers.tmasteries{ ["technique/other"]=0.3, ["technique/2hweapon-offense"]=0.3, ["technique/2hweapon-cripple"]=0.3 },
		open_door = true,
		cut_immune = 1,
		blind_immune = 1,
		fear_immune = 1,
		poison_immune = 1,
		see_invisible = 2,
		undead = 1,
		rarity = 1,

		resolvers.inscriptions(1, "rune"),
		resolvers.talents{
			T_WEAPON_COMBAT={base=1, every=7, max=10},
			T_WEAPONS_MASTERY={base=1, every=7, max=10},
			T_ARMOUR_TRAINING={base=2, every=14, max=4},
			T_SHIELD_PUMMEL={base=1, every=7, max=5},
			T_RIPOSTE={base=3, every=7, max=7},
			T_OVERPOWER={base=1, every=7, max=5},
			T_DISARM={base=3, every=7, max=7},
		},
		resolvers.equip{ {type="weapon", subtype="longsword", autoreq=true}, {type="armor", subtype="shield", autoreq=true}, {type="armor", subtype="heavy", autoreq=true} },
		ai_state = { talent_in=1, },
	},
}
local skeleton_archer_list = {
	skel_archer = {
		type = "undead", subtype = "skeleton",
		name = "skeleton archer", color=colors.UMBER, image="npc/skeleton_archer.png",
		blood_color = colors.GREY,
		display = "s",
		combat = { dam=1, atk=1, apr=1 },
		level_range = {1, nil}, exp_worth = 0,
		body = { INVEN = 10, MAINHAND=1, OFFHAND=1, BODY=1, QUIVER=1 },
		infravision = 10,
		rank = 2,
		size_category = 3,
		autolevel = "warrior",
		ai = "dumb_talented_simple", ai_state = { ai_move="move_complex", talent_in=4, },
		stats = { str=14, dex=12, mag=10, con=12 },
		resolvers.racial(),
		resolvers.tmasteries{ ["technique/other"]=0.3, ["technique/2hweapon-offense"]=0.3, ["technique/2hweapon-cripple"]=0.3 },
		open_door = true,
		cut_immune = 1,
		blind_immune = 1,
		fear_immune = 1,
		poison_immune = 1,
		see_invisible = 2,
		undead = 1,
		rarity = 1,
		max_life = resolvers.rngavg(70,80),
		combat_armor = 5, combat_def = 1,
		resolvers.talents{ T_BOW_MASTERY={base=1, every=7, max=10}, T_WEAPON_COMBAT={base=1, every=7, max=10}, T_SHOOT=1, },
		blighted_summon_talent = "T_BONE_SPEAR",
		ai_state = { talent_in=1, },
		autolevel = "archer",
		resolvers.equip{ {type="weapon", subtype="longbow", autoreq=true}, {type="ammo", subtype="arrow", autoreq=true} },
	},
	skel_m_archer = {
		type = "undead", subtype = "skeleton",
		name = "skeleton master archer", color=colors.LIGHT_UMBER, image="npc/master_skeleton_archer.png",
		blood_color = colors.GREY,
		display = "s",
		combat = { dam=1, atk=1, apr=1 },
		level_range = {1, nil}, exp_worth = 0,
		body = { INVEN = 10, MAINHAND=1, OFFHAND=1, BODY=1, QUIVER=1 },
		infravision = 10,
		rank = 2,
		size_category = 3,
		autolevel = "warrior",
		ai = "dumb_talented_simple", ai_state = { ai_move="move_complex", talent_in=4, },
		stats = { str=14, dex=12, mag=10, con=12 },
		resolvers.racial(),
		resolvers.tmasteries{ ["technique/other"]=0.3, ["technique/2hweapon-offense"]=0.3, ["technique/2hweapon-cripple"]=0.3 },
		open_door = true,
		cut_immune = 1,
		blind_immune = 1,
		fear_immune = 1,
		poison_immune = 1,
		see_invisible = 2,
		undead = 1,
		rarity = 1,

		max_life = resolvers.rngavg(70,80),
		combat_armor = 5, combat_def = 1,
		resolvers.talents{ T_BOW_MASTERY={base=1, every=7, max=10}, T_WEAPON_COMBAT={base=1, every=7, max=10}, T_SHOOT=1, T_PINNING_SHOT=3, T_CRIPPLING_SHOT=3, },
		blighted_summon_talent = "T_BONE_SPEAR",
		ai_state = { talent_in=1, },
		rank = 3,
		autolevel = "archer",
		resolvers.equip{ {type="weapon", subtype="longbow", autoreq=true}, {type="ammo", subtype="arrow", autoreq=true} },
	},
}

local skeleton_mage_list = {
	skel_mage = {
		type = "undead", subtype = "skeleton",
		name = "skeleton mage", color=colors.LIGHT_RED, image="npc/skeleton_mage.png",
		blood_color = colors.GREY,
		display = "s",
		combat = { dam=1, atk=1, apr=1 },
		level_range = {1, nil}, exp_worth = 0,
		body = { INVEN = 10, MAINHAND=1, OFFHAND=1, BODY=1, QUIVER=1 },
		infravision = 10,
		rank = 2,
		size_category = 3,
		autolevel = "warrior",
		ai = "dumb_talented_simple", ai_state = { ai_move="move_complex", talent_in=4, },
		stats = { str=14, dex=12, mag=10, con=12 },
		resolvers.racial(),
		resolvers.tmasteries{ ["technique/other"]=0.3, ["technique/2hweapon-offense"]=0.3, ["technique/2hweapon-cripple"]=0.3 },
		open_door = true,
		cut_immune = 1,
		blind_immune = 1,
		fear_immune = 1,
		poison_immune = 1,
		see_invisible = 2,
		undead = 1,
		rarity = 1,

		max_life = resolvers.rngavg(50,60),
		max_mana = resolvers.rngavg(70,80),
		combat_armor = 3, combat_def = 1,
		stats = { str=10, dex=12, cun=14, mag=14, con=10 },
		resolvers.talents{ T_STAFF_MASTERY={base=1, every=10, max=5}, T_FLAME={base=1, every=7, max=5}, T_MANATHRUST={base=2, every=7, max=5} },
		blighted_summon_talent = "T_BONE_SPEAR",
		resolvers.equip{ {type="weapon", subtype="staff", autoreq=true} },
		autolevel = "caster",
		ai_state = { talent_in=1, },
	},
	skel_magus = {
		type = "undead", subtype = "skeleton",
		name = "skeleton magus", color=colors.LIGHT_RED, --, image="npc/skeleton_mage.png",
		blood_color = colors.GREY,
		display = "s",
		combat = { dam=1, atk=1, apr=1 },
		level_range = {1, nil}, exp_worth = 0,
		body = { INVEN = 10, MAINHAND=1, OFFHAND=1, BODY=1, QUIVER=1 },
		infravision = 10,
		rank = 2,
		size_category = 3,
		autolevel = "warrior",
		ai = "dumb_talented_simple", ai_state = { ai_move="move_complex", talent_in=4, },
		stats = { str=14, dex=12, mag=10, con=12 },
		resolvers.racial(),
		resolvers.tmasteries{ ["technique/other"]=0.3, ["technique/2hweapon-offense"]=0.3, ["technique/2hweapon-cripple"]=0.3 },
		open_door = true,
		cut_immune = 1,
		blind_immune = 1,
		fear_immune = 1,
		poison_immune = 1,
		see_invisible = 2,
		undead = 1,
		rarity = 1,

		max_life = resolvers.rngavg(50,60),
		max_mana = resolvers.rngavg(70,80),
		combat_armor = 3, combat_def = 1,
		stats = { str=10, dex=12, cun=16, mag=18, con=10 },
		resolvers.talents{ T_STAFF_MASTERY={base=2, every=10, max=5}, T_FLAME={base=1, every=7, max=5}, T_MANATHRUST={base=2, every=7, max=5}, T_ARCANE_POWER={base=2, every=7, max=5} },
		blighted_summon_talent = "T_BONE_SPEAR",
		resolvers.equip{ {type="weapon", subtype="staff", autoreq=true} },
		autolevel = "caster",
		ai_state = { talent_in=1, },
	},
}

local skeleton_warrior_order = {"d_skel_warrior", "skel_warrior", "a_skel_warrior"} -- Sets listing order
local skeleton_archer_order = {"skel_archer", "skel_m_archer"}
local skeleton_mage_order = {"skel_mage"}

local function getSkeletonWarriorChances(self)
  local quality = math.floor(self:getTalentLevel(self.T_SKELETON_MASTERY))
	if quality == 2 then
		return { d_skel_warrior=50, skel_warrior=40, a_skel_warrior=10 }
	elseif quality == 3 then
		return { d_skel_warrior=25, skel_warrior=50, a_skel_warrior=25 }
	elseif quality == 4 then
		return { d_skel_warrior=0, skel_warrior=75, a_skel_warrior=25 }
	elseif quality == 5 then
		return { d_skel_warrior=0, skel_warrior=50, a_skel_warrior=50 }
	elseif quality == 6 then
		return { d_skel_warrior=0, skel_warrior=0, a_skel_warrior=100 }
	else
		-- level 1 or 0
		return { d_skel_warrior=80, skel_warrior=20, a_skel_warrior=0 }
	end
end

local function getSkeletonArcherChances(self)
  local quality = math.floor(self:getTalentLevel(self.T_SKELETON_MASTERY))
	if quality == 2 then
		return { skel_archer=80, skel_m_archer=20 }
	elseif quality == 3 then
		return { skel_archer=60, skel_m_archer=40 }
	elseif quality == 4 then
		return { skel_archer=40, skel_m_archer=60 }
	elseif quality == 5 then
		return { skel_archer=20, skel_m_archer=80 }
	elseif quality == 6 then
		return { skel_archer=0, skel_m_archer=100 }
	else
		-- level 1 or 0
	  return { skel_archer=100, skel_m_archer=0 }
	end
end

local function getSkeletonMageChances(self)
	local quality = math.floor(self:getTalentLevel(self.T_SKELETON_MASTERY))
	if quality == 2 then
		return { skel_mage=80, skel_magus=20 }
	elseif quality == 3 then
		return { skel_mage=60, skel_magus=40 }
	elseif quality == 4 then
		return { skel_mage=40, skel_magus=60 }
	elseif quality == 5 then
		return { skel_mage=20, skel_magus=80 }
	elseif quality == 6 then
		return { skel_mage=0, skel_magus=100 }
	else
		-- level 1 or 0
	  return { skel_mage=100, skel_magus=0 }
	end
end

local function getLichChances(self)
	return { lich=100 }
end

local function summonSkeletonWarrior(self, lev)
	local chances = getSkeletonWarriorChances(self)
	local pick = rng.float(0,100)
	local tot, m = 0
	for k, e in pairs(chances) do
		tot = tot + e
		if tot > pick then
			m = k
			break
		end
	end
	m = require("mod.class.NPC").new(skeleton_warrior_list[m])
	m.necrotic_minion = true
	m.minion_type = "warrior"
	return m
end

local function summonSkeletonArcher(self, lev)
	local chances = getSkeletonArcherChances(self)
	local pick = rng.float(0,100)
	local tot, m = 0
	for k, e in pairs(chances) do
		tot = tot + e
		if tot > pick then
			m = k
			break
		end
	end
	m = require("mod.class.NPC").new(skeleton_archer_list[m])
	m.necrotic_minion = true
	m.minion_type = "archer"
	return m
end

local function summonSkeletonMage(self, lev)
	local chances = getSkeletonMageChances(self)
	local pick = rng.float(0,100)
	local tot, m = 0
	for k, e in pairs(chances) do
		tot = tot + e
		if tot > pick then
			m = k
			break
		end
	end
	m = require("mod.class.NPC").new(skeleton_mage_list[m])
	m.necrotic_minion = true
	m.minion_type = "mage"
	return m
end

newTalent{
	name = "Summon Skeleton Warriors",
	type = {"spell/skeletal-minions",1},
	require = spells_req1,
	points = 5,
	fake_ressource = true,
	mana = 10,
	cooldown = 14,
	tactical = { ATTACK = 10 },
	requires_target = true,
	range = 0,
	radius = function(self, t)
		return 2 + self:getTalentLevelRaw(self.T_SUMMON_SKELETON_WARRIORS)
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
		local c = getSkeletonWarriorChances(self)
		local chancelist = tstring({})
		for i, k in ipairs(skeleton_warrior_order) do
			if c[k] then
				chancelist:add(true,skeleton_warrior_list[k].name:capitalize(),(": %d%%"):format(c[k]))
			end
		end
		return chancelist:toString()
	end,
	action = function(self, t)
		-- only allow the summon if we haven't exceeded the limit
		local nb = t.getMax(self, t)
		if trueNecroGetNbSummon(self,"warrior") < nb then
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
			local minion = summonSkeletonWarrior(self, self:getTalentLevel(t))
			local pos = rng.tableRemove(possible_spots)
			if minion and pos then
				if use_ressource then self:incSoul(-1) end
				necroSetupSummon(self, minion, pos.x, pos.y, lev)
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
		local mm = self:knowTalent(self.T_SKELETON_MASTERY) and " (Minion Strength effects included)" or ""
		return ([[Expend one of your captured souls to raise a long dead warrior to do your bidding. You can control up to %d warriors. The minion will be raised within a cone with a range of %d.
		The minions level is your level %+d.
		Each minion has a chance to be%s:%s]]):
		format(nb, self:getTalentRadius(t), lev, mm, t.MinionChancesDesc(self, t))
	end,
}

newTalent{
	name = "Summon Skeleton Archers",
	type = {"spell/skeletal-minions",2},
	require = spells_req2,
	points = 5,
	fake_ressource = true,
	mana = 15,
	soul = function(self, t) return math.max(1, math.min(t.getMax(self, t), self:getSoul())) end,
	cooldown = 14,
	tactical = { ATTACK = 10 },
	requires_target = true,
	range = 0,
	radius = function(self, t)
		return 2 + self:getTalentLevelRaw(self.T_SUMMON_SKELETON_ARCHERS)
	end,
	target = function(self, t)
		return {type="cone", range=self:getTalentRange(t), radius=self:getTalentRadius(t), selffire=false, talent=t}
	end,
	getMax = function(self, t)
		return math.floor(self:getTalentLevel(t))
	end, -- talent level 1-5 gives 1-5
	getLevel = function(self, t)
		return math.floor(self:combatScale(self:getTalentLevel(t), -6, 0.9, 2, 5)) + math.floor(self:getTalentLevel(self.T_MINION_STRENGTH))
	end, -- -6 @ 1, +2 @ 5, +5 @ 8
	MinionChancesDesc = function(self)
		local c = getSkeletonArcherChances(self)
		local chancelist = tstring({})
		for i, k in ipairs(skeleton_archer_order) do
			if c[k] then
				chancelist:add(true,skeleton_archer_list[k].name:capitalize(),(": %d%%"):format(c[k]))
			end
		end
		return chancelist:toString()
	end,
	action = function(self, t)
		-- only allow the summon if we haven't exceeded the limit
		local nb = t.getMax(self, t)
		if trueNecroGetNbSummon(self,"archer") < nb then
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
			local minion = summonSkeletonArcher(self, self:getTalentLevel(t))
			local pos = rng.tableRemove(possible_spots)
			if minion and pos then
				if use_ressource then self:incSoul(-1) end
				necroSetupSummon(self, minion, pos.x, pos.y, lev)
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
		local mm = self:knowTalent(self.T_SKELETON_MASTERY) and " (Minion Strength effects included)" or ""
		return ([[Expend one of your captured souls to raise a long dead marksman to do your bidding. You can control up to %d archers. The minion will be raised within a cone with a range of %d.
		The minion's level is your level %+d.
		Each minion has a chance to be%s:%s]]):
		format(nb, self:getTalentRadius(t), lev, mm, t.MinionChancesDesc(self, t))
	end,
}

newTalent{
	name = "Summon Skeleton Mages",
	type = {"spell/skeletal-minions",3},
	require = spells_req3,
	points = 5,
	fake_ressource = true,
	mana = 25,
	soul = function(self, t) return math.max(1, math.min(t.getMax(self, t), self:getSoul())) end,
	cooldown = 14,
	tactical = { ATTACK = 10 },
	requires_target = true,
	range = 0,
	radius = function(self, t)
		return 2 + self:getTalentLevelRaw(self.T_SUMMON_SKELETON_MAGES)
	end,
	target = function(self, t)
		return {type="cone", range=self:getTalentRange(t), radius=self:getTalentRadius(t), selffire=false, talent=t}
	end,
	getMax = function(self, t)
		return math.floor(self:getTalentLevel(t))
	end,
	getLevel = function(self, t)
		return math.floor(self:combatScale(self:getTalentLevel(t), -6, 0.9, 2, 5)) + math.floor(self:getTalentLevel(self.T_MINION_STRENGTH))
	end, -- -6 @ 1, +2 @ 5, +5 @ 8
	MinionChancesDesc = function(self)
		local c = getSkeletonMageChances(self)
		local chancelist = tstring({})
		for i, k in ipairs(skeleton_mage_order) do
			if c[k] then
				chancelist:add(true,skeleton_mage_list[k].name:capitalize(),(": %d%%"):format(c[k]))
			end
		end
		return chancelist:toString()
	end,
	action = function(self, t)
		-- only allow the summon if we haven't exceeded the limit
		local nb = t.getMax(self, t)
		if trueNecroGetNbSummon(self,"mage") < nb then
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
			local minion = summonSkeletonMage(self, self:getTalentLevel(t))
			local pos = rng.tableRemove(possible_spots)
			if minion and pos then
				if use_ressource then self:incSoul(-1) end
				necroSetupSummon(self, minion, pos.x, pos.y, lev)
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
		local mm = self:knowTalent(self.T_SKELETON_MASTERY) and " (Minion Strength effects included)" or ""
		return ([[Expend one of your captured souls, raising an undead mage to do your bidding. You can control up to %d mages. The minions will be raised within a cone with a range of %d.
		The minion's level is your level %+d.
		Each minion has a chance to be%s:%s]]):
		format(nb, self:getTalentRadius(t), lev, mm, t.MinionChancesDesc(self, t))
	end,
}

newTalent{
	name = "Skeleton Mastery",
	type = {"spell/skeletal-minions",4},
	require = spells_req4,
	points = 5,
	mode = "passive",
	info = function(self, t)
		return ([[Increases the quality of your minions.]])
	end,
}
