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
}

local lich_list = {
	lich = {
		type = "undead", subtype = "lich",
		display = "L",
		rank = 3, size = 3,
		combat = { dam=resolvers.rngavg(16,27), atk=16, apr=9, damtype=DamageType.DARKSTUN, dammod={mag=0.9} },
		body = { INVEN = 10, MAINHAND = 1, OFFHAND = 1, FINGER = 2, NECK = 1, LITE = 1, BODY = 1, HEAD = 1, CLOAK = 1, HANDS = 1, BELT = 1, FEET = 1},
		equipment = resolvers.equip{
			{type="armor", subtype="cloth", ego_chance=75, autoreq=true},
			{type="armor", subtype="head", ego_chance=75, autoreq=true},
			{type="armor", subtype="feet", ego_chance=75, autoreq=true},
			{type="armor", subtype="cloak", ego_chance=75, autoreq=true},
			{type="jewelry", subtype="amulet", ego_chance=100, autoreq=true},
			{type="jewelry", subtype="ring", ego_chance=100, autoreq=true},
			{type="jewelry", subtype="ring", ego_chance=100, autoreq=true},
		},
		autolevel = "caster",
		ai = "tactical", ai_state = { talent_in=1, },
		ai_tactic = resolvers.tactic"ranged",
		stats = { str=8, dex=15, mag=20, wil=18, con=10, cun=18 },
		resists = { [DamageType.NATURE] = 90, [DamageType.FIRE] = 20, [DamageType.MIND] = 100, [DamageType.LIGHT] = -60, [DamageType.DARKNESS] = 95, [DamageType.BLIGHT] = 90 },
		resolvers.inscriptions(3, "rune"),
		instakill_immune = 1,
		stun_immune = 1,
		poison_immune = 1,
		undead = 1,
		blind_immune = 1,
		see_invisible = 100,
		infravision = 10,
		silence_immune = 0.7,
		fear_immune = 1,
		negative_regen = 0.4,	-- make their negative energies slowly increase
		mana_regen = 0.3,
		hate_regen = 2,
		open_door = 1,
		combat_spellpower = resolvers.mbonus(20, 10),
		combat_spellcrit = resolvers.mbonus(5, 5),
		resolvers.sustains_at_birth(),
		name = "lich", color=colors.DARK_BLUE,
		desc=[[Having thought to discover life eternal, these beings have allowed undeath to rob them of the joys of life. Now they seek to destroy it as well.]],
		resolvers.nice_tile{image="invis.png", add_mos = {{image="npc/undead_lich_lich.png", display_h=2, display_y=-1}}},
		level_range = {1, nil}, exp_worth = 0,
		rarity = 20,
		max_life = resolvers.rngavg(70,80),
		combat_armor = 10, combat_def = 20,
		resolvers.talents{
			T_HYMN_OF_SHADOWS=4,
			T_MOONLIGHT_RAY=5,
			T_SHADOW_BLAST=5,
			T_TWILIGHT_SURGE=3,
			T_STARFALL=3,
			T_FREEZE=3,
			T_MANATHRUST=5,
			T_CONGEAL_TIME=5,
--			T_CREEPING_DARKNESS=4,
			T_DARK_VISION=4,
			T_DARK_TORRENT=4,
--			T_DARK_TENDRILS=4,
			T_BONE_GRAB=4,
			T_BONE_SPEAR=4,
			-- Utility spells
			T_PHASE_DOOR=5,
			T_TELEPORT=5,
			T_STONE_SKIN=5,

			T_CALL_SHADOWS=3,
			T_FOCUS_SHADOWS=3,
			T_SHADOW_MAGES=1,
			T_SHADOW_WARRIORS=1,
		},
	},
}

local skeleton_warrior_order = {"d_skel_warrior", "skel_warrior", "a_skel_warrior"} -- Sets listing order
local skeleton_archer_order = {"skel_archer", "skel_m_archer"}
local skeleton_mage_order = {"skel_mage"}
local lich_order = {"lich"}
--local minion_order = {"d_skel_warrior", "skel_warrior", "a_skel_warrior", "skel_archer", "skel_m_archer", "skel_mage", "ghoul", "ghast", "ghoulking","vampire", "m_vampire", "g_wight", "b_wight", "dread", "lich"} -- Sets listing order

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
	return { skel_mage=100 }
end

local function getLichChances(self)
	return { lich=100 }
end

--[[
local function getMinionChances(self)
	local cl = math.floor(self:getTalentLevel(self.T_CREATE_MINIONS))
	if cl <= 1 then
		return { d_skel_warrior=55, skel_warrior=10, a_skel_warrior=0, skel_archer=10, skel_m_archer=0, skel_mage=5,   ghoul=20, ghast=0, ghoulking=0 }
	elseif cl == 2 then
		return { d_skel_warrior=31, skel_warrior=15, a_skel_warrior=2, skel_archer=15, skel_m_archer=2, skel_mage=10,  ghoul=20, ghast=5, ghoulking=0 }
	elseif cl == 3 then
		return { d_skel_warrior=24, skel_warrior=15, a_skel_warrior=5, skel_archer=20, skel_m_archer=4, skel_mage=10,  ghoul=15, ghast=5, ghoulking=2 }
	elseif cl == 4 then
		return { d_skel_warrior=9, skel_warrior=20, a_skel_warrior=10, skel_archer=15, skel_m_archer=6, skel_mage=10,  ghoul=15, ghast=10, ghoulking=5 }
	elseif cl == 5 then
		return { d_skel_warrior=9, skel_warrior=20, a_skel_warrior=10, skel_archer=10, skel_m_archer=8, skel_mage=15,  ghoul=10, ghast=10, ghoulking=8 }
	elseif cl >= 6 then
		return { d_skel_warrior=0, skel_warrior=25, a_skel_warrior=15, skel_archer=10, skel_m_archer=10, skel_mage=15, ghoul=5, ghast=10, ghoulking=10 }
	end
end
--]]

local function summonSkeletonWarrior(self, lev)
	local chances = getSkeletonWarriorChances(self)
	local pick = rng.float(0,100)
	local tot, m = 0
	for k, e in pairs(chances) do
		game.logSeen(self, ("%s - %d"):format(k, e))
		tot = tot + e
		if tot > pick then
			game.logSeen(self, ("Summoning %s - tot:%d, pick:%d"):format(k, tot, pick))
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
		game.logSeen(self, ("%s - %d"):format(k, e))
		tot = tot + e
		if tot > pick then
			game.logSeen(self, ("Summoning %s - tot:%d, pick:%d"):format(k, tot, pick))
			m = k
			break
		end
	end
	m = require("mod.class.NPC").new(skeleton_archer_list[m])
	m.necrotic_minion = true
	return m
end

local function summonSkeletonMage(self, lev)
	local chances = getSkeletonMageChances(self)
	local pick = rng.float(0,100)
	local tot, m = 0
	for k, e in pairs(chances) do
		game.logSeen(self, ("%s - %d"):format(k, e))
		tot = tot + e
		if tot > pick then
			game.logSeen(self, ("Summoning %s - tot:%d, pick:%d"):format(k, tot, pick))
			m = k
			break
		end
	end
	m = require("mod.class.NPC").new(skeleton_mage_list[m])
	m.necrotic_minion = true
	return m
end

local function summonLich(self, lev)
	local chances = getLichChances(self)
	local pick = rng.float(0,100)
	local tot, m = 0
	for k, e in pairs(chances) do
		game.logSeen(self, ("%s - %d"):format(k, e))
		tot = tot + e
		if tot > pick then
			game.logSeen(self, ("Summoning %s - tot:%d, pick:%d"):format(k, tot, pick))
			m = k
			break
		end
	end
	m = require("mod.class.NPC").new(lich_list[m])
	m.necrotic_minion = true
	return m
end

newTalent{
	name = "Summon Skeleton Warriors",
	type = {"spell/skeletal-minions",1},
	require = spells_req1,
	points = 5,
	fake_ressource = true,
	mana = 10, --+(math.floor(self:getTalentLevel(self.T_SUMMON_SKELETON_WARRIORS), "log")*2),
	soul = function(self, t) return math.max(1, math.min(t.getMax(self, t), self:getSoul())) end,
	cooldown = 14,
	tactical = { ATTACK = 10 },
	requires_target = true,
	range = 0,
	autolearn_talent = "T_TRUE_NECROTIC_AURA",
	radius = function(self, t)
		local aura = self:getTalentFromId(self.T_TRUE_NECROTIC_AURA)
		return aura.getRadius(self, aura)
	end,
	target = function(self, t)
		return {type="cone", range=self:getTalentRange(t), radius=self:getTalentRadius(t), selffire=false, talent=t}
	end,
	on_pre_use = function(self, t)
		local p = self:isTalentActive(self.T_TRUE_NECROTIC_AURA)
		if not p then return end
		return true
	end,
	getMax = function(self, t)
		local max = math.max(1, math.floor(self:combatTalentScale(t, 1, math.floor(self:getTalentLevel(self.T_SUMMON_SKELETON_WARRIORS)))))--, "log"))))
		--if necroEssenceDead(self, true) then max = max + 2 end
		return max - trueNecroGetNbSummon(self, "warrior")
	end, -- talent level 1-5 gives 1-5
	getLevel = function(self, t) return math.floor(self:combatScale(self:getTalentLevel(t), -6, 0.9, 2, 5)) end, -- -6 @ 1, +2 @ 5, +5 @ 8
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
		local p = self:isTalentActive(self.T_TRUE_NECROTIC_AURA)
		local nb = t.getMax(self, t)
		nb = math.min(nb, self:getSoul())
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
		--for i = 1, nb do
		local minion = summonSkeletonWarrior(self, self:getTalentLevel(t))
		local pos = rng.tableRemove(possible_spots)
		local no_decay = math.floor(self:getTalentLevel(self.T_TRUE_AURA_MASTERY), "log") > 4 -- stop decay at level 5
		if minion and pos then
			if use_ressource then self:incSoul(-1) end
			necroSetupSummon(self, minion, pos.x, pos.y, lev, no_decay)--, "warrior")
		end
		--end

		local empower = necroEssenceDead(self)
		if empower then empower() end

		if use_ressource then self:incMana(-util.getval(t.mana, self, t) * (100 + 2 * self:combatFatigue()) / 100) end
		game:playSoundNear(self, "talents/spell_generic2")
		return true
	end,
	info = function(self, t)
		local nb = t.getMax(self, t)
		local lev = t.getLevel(self, t)
		local mm = self:knowTalent(self.T_SKELETON_MASTERY) and " (Minion Strength effects included)" or ""
		return ([[Fires powerful undead energies through your necrotic aura. Expend a soul to produce a skeleton warrior. You can support up to %d warriors. The minion will be raised within a cone that extends to the edge of your necrotic aura.
		The minions level is your level %+d.
		Each minion has a chance to be%s:%s]]):
		format(nb, lev, mm, t.MinionChancesDesc(self, t))
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
	autolearn_talent = "T_TRUE_NECROTIC_AURA",
	radius = function(self, t)
		local aura = self:getTalentFromId(self.T_TRUE_NECROTIC_AURA)
		return aura.getRadius(self, aura)
	end,
	target = function(self, t)
		return {type="cone", range=self:getTalentRange(t), radius=self:getTalentRadius(t), selffire=false, talent=t}
	end,
	on_pre_use = function(self, t)
		local p = self:isTalentActive(self.T_TRUE_NECROTIC_AURA)
		if not p then return end
		return true
	end,
	getMax = function(self, t)
		local max = math.max(1, math.floor(self:combatTalentScale(t, 1, 5, "log")))
		if necroEssenceDead(self, true) then max = max + 2 end
		return max - trueNecroGetNbSummon(self, "archer")
	end, -- talent level 1-5 gives 1-5
	getLevel = function(self, t) return math.floor(self:combatScale(self:getTalentLevel(t), -6, 0.9, 2, 5)) end, -- -6 @ 1, +2 @ 5, +5 @ 8
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
		local p = self:isTalentActive(self.T_TRUE_NECROTIC_AURA)
		local nb = t.getMax(self, t)
		nb = math.min(nb, self:getSoul())
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
			local minion = summonSkeletonArcher(self, self:getTalentLevel(t))
			local pos = rng.tableRemove(possible_spots)
			local no_decay = math.floor(self:getTalentLevel(self.T_SUMMON_SKELETON_ARCHERS)) > 4 -- stop decay at level 5
			if minion and pos then
				if use_ressource then self:incSoul(-1) end
				necroSetupSummon(self, minion, pos.x, pos.y, lev, no_decay)--, "archer")
			end
		end

		local empower = necroEssenceDead(self)
		if empower then empower() end

		if use_ressource then self:incMana(-util.getval(t.mana, self, t) * (100 + 2 * self:combatFatigue()) / 100) end
		game:playSoundNear(self, "talents/spell_generic2")
		return true
	end,
	info = function(self, t)
		local nb = t.getMax(self, t)
		local lev = t.getLevel(self, t)
		local mm = self:knowTalent(self.T_SKELETON_MASTERY) and " (Minion Strength effects included)" or ""
		return ([[Fires powerful undead energies through your necrotic aura. For each recent death that happened inside your aura, you will raise an undead minion (up to %d minions). These minions will be raised within a cone that extends to the edge of your necrotic aura.
		The minions level is your level %+d.
		Each minion has a chance to be%s:%s]]):
		format(nb, lev, mm, t.MinionChancesDesc(self, t))
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
	autolearn_talent = "T_TRUE_NECROTIC_AURA",
	radius = function(self, t)
		local aura = self:getTalentFromId(self.T_TRUE_NECROTIC_AURA)
		return aura.getRadius(self, aura)
	end,
	target = function(self, t)
		return {type="cone", range=self:getTalentRange(t), radius=self:getTalentRadius(t), selffire=false, talent=t}
	end,
	on_pre_use = function(self, t)
		local p = self:isTalentActive(self.T_TRUE_NECROTIC_AURA)
		if not p then return end
		return true
	end,
	getMax = function(self, t)
		local max = math.max(1, math.floor(self:combatTalentScale(t, 1, 5, "log")))
		if necroEssenceDead(self, true) then max = max + 2 end
		return max - trueNecroGetNbSummon(self, "mage")
	end, -- talent level 1-5 gives 1-5
	getLevel = function(self, t) return math.floor(self:combatScale(self:getTalentLevel(t), -6, 0.9, 2, 5)) end, -- -6 @ 1, +2 @ 5, +5 @ 8
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
		local p = self:isTalentActive(self.T_TRUE_NECROTIC_AURA)
		local nb = t.getMax(self, t)
		nb = math.min(nb, self:getSoul())
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
			local minion = summonSkeletonMage(self, self:getTalentLevel(t))
			local pos = rng.tableRemove(possible_spots)
			local no_decay = math.floor(self:getTalentLevel(self.T_SUMMON_SKELETON_MAGES)) > 4 -- stop decay at level 5
			if minion and pos then
				if use_ressource then self:incSoul(-1) end
				necroSetupSummon(self, minion, pos.x, pos.y, lev, no_decay)--, "mage")
			end
		end

		local empower = necroEssenceDead(self)
		if empower then empower() end

		if use_ressource then self:incMana(-util.getval(t.mana, self, t) * (100 + 2 * self:combatFatigue()) / 100) end
		game:playSoundNear(self, "talents/spell_generic2")
		return true
	end,
	info = function(self, t)
		local nb = t.getMax(self, t)
		local lev = t.getLevel(self, t)
		local mm = self:knowTalent(self.T_SKELETON_MASTERY) and " (Minion Strength effects included)" or ""
		return ([[Fires powerful undead energies through your necrotic aura. For each recent death that happened inside your aura, you will raise an undead minion (up to %d minions). These minions will be raised within a cone that extends to the edge of your necrotic aura.
		The minions level is your level %+d.
		Each minion has a chance to be%s:%s]]):
		format(nb, lev, mm, t.MinionChancesDesc(self, t))
	end,
}

newTalent{
	name = "Skeleton Mastery",
	type = {"spell/skeletal-minions",4},
	require = spells_req4,
	points = 5,
	mode = "passive",
	info = function(self, t)
		return ([[Increases the quality of your minions. Minion damage is increased by %d%% and health by %d%%.]]):
		format(self:getTalentLevelRaw(t)*5, self:getTalentLevelRaw(t)*5)
	end,
}

--[[
newTalent{
	name = "Summon Lich",
	type = {"spell/skeletal-minions",4},
	require = spells_req4,
	points = 5,
	fake_ressource = true,
	mana = 5,
	soul = function(self, t) return math.max(1, math.min(t.getMax(self, t), self:getSoul())) end,
	cooldown = 14,
	tactical = { ATTACK = 10 },
	requires_target = true,
	range = 0,
	autolearn_talent = "T_TRUE_NECROTIC_AURA",
	radius = function(self, t)
		local aura = self:getTalentFromId(self.T_TRUE_NECROTIC_AURA)
		return aura.getRadius(self, aura)
	end,
	target = function(self, t)
		return {type="cone", range=self:getTalentRange(t), radius=self:getTalentRadius(t), selffire=false, talent=t}
	end,
	on_pre_use = function(self, t)
		local p = self:isTalentActive(self.T_TRUE_NECROTIC_AURA)
		if not p then return end
		return true
	end,
	getMax = function(self, t)
		local max = math.max(1, math.floor(self:combatTalentScale(t, 1, 5, "log")))
		if necroEssenceDead(self, true) then max = max + 2 end
		return max - trueNecroGetNbSummon(self, "lich")
	end, -- talent level 1-5 gives 1-5
	getLevel = function(self, t) return math.floor(self:combatScale(self:getTalentLevel(t), -6, 0.9, 2, 5)) end, -- -6 @ 1, +2 @ 5, +5 @ 8
	MinionChancesDesc = function(self)
		local c = getLichChances(self)
		local chancelist = tstring({})
		for i, k in ipairs(lich_order) do
			if c[k] then
				chancelist:add(true,lich_list[k].name:capitalize(),(": %d%%"):format(c[k]))
			end
		end
		return chancelist:toString()
	end,
	action = function(self, t)
		local p = self:isTalentActive(self.T_TRUE_NECROTIC_AURA)
		local nb = t.getMax(self, t)
		nb = math.min(nb, self:getSoul())
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
			local minion = summonLich(self, self:getTalentLevel(t))
			local pos = rng.tableRemove(possible_spots)
			local no_decay = math.floor(self:getTalentLevel(self.T_SUMMON_LICH)) > 4 -- stop decay at level 5
			if minion and pos then
				if use_ressource then self:incSoul(-1) end
				necroSetupSummon(self, minion, pos.x, pos.y, lev, no_decay, "lich")
			end
		end

		local empower = necroEssenceDead(self)
		if empower then empower() end

		if use_ressource then self:incMana(-util.getval(t.mana, self, t) * (100 + 2 * self:combatFatigue()) / 100) end
		game:playSoundNear(self, "talents/spell_generic2")
		return true
	end,
	info = function(self, t)
		local nb = t.getMax(self, t)
		local lev = t.getLevel(self, t)
		local mm = self:knowTalent(self.T_SKELETON_MASTERY) and " (Minion Strength effects included)" or ""
		return ([[Fires powerful undead energies through your necrotic aura. For each recent death that happened inside your aura, you will raise an undead minion (up to %d minions). These minions will be raised within a cone that extends to the edge of your necrotic aura.
		The minions level is your level %+d.
		Each minion has a chance to be%s:%s]REMOVEME]):
		format(nb, lev, mm, t.MinionChancesDesc(self, t))
	end,
}
--]]

--return _M
