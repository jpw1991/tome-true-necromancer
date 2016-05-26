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

local wight_list = {
	g_wight = {
		type = "undead", subtype = "wight",
		display = "W",
		combat = { dam=resolvers.mbonus(30, 10), atk=10, apr=9, damtype=DamageType.DRAINEXP },
		body = { INVEN = 10, MAINHAND=1, OFFHAND=1, BODY=1 },
		level_range = {1, nil}, exp_worth = 0,
		autolevel = "caster",
		ai = "dumb_talented_simple", ai_state = { ai_move="move_complex", talent_in=4, },
		stats = { str=11, dex=11, mag=15, con=12 },
		infravision = 10,
		rank = 2,
		size_category = 3,
		open_door = true,
		resolvers.sustains_at_birth(),
		resists = { [DamageType.COLD] = 80, [DamageType.FIRE] = 20, [DamageType.LIGHTNING] = 40, [DamageType.PHYSICAL] = 35, [DamageType.LIGHT] = -50, },
		poison_immune = 1,
		blind_immune = 1,
		see_invisible = 7,
		undead = 1,
		name = "grave wight", color=colors.SLATE, image="npc/grave_wight.png",
		desc=[[It is a ghostly form with eyes that haunt you.]],
		max_life = resolvers.rngavg(70,80),
		combat_armor = 9, combat_def = 6,
		resolvers.talents{ T_FLAMESHOCK={base=2, every=5, max=6}, T_LIGHTNING={base=2, every=5, max=6}, T_GLACIAL_VAPOUR={base=2, every=5, max=6},
			T_MIND_DISRUPTION={base=2, every=5, max=6},
		},
	},
	b_wight = {
		type = "undead", subtype = "wight",
		display = "W",
		combat = { dam=resolvers.mbonus(30, 10), atk=10, apr=9, damtype=DamageType.DRAINEXP },
		body = { INVEN = 10, MAINHAND=1, OFFHAND=1, BODY=1 },
		level_range = {1, nil}, exp_worth = 0,
		autolevel = "caster",
		ai = "dumb_talented_simple", ai_state = { ai_move="move_complex", talent_in=4, },
		stats = { str=11, dex=11, mag=15, con=12 },
		infravision = 10,
		rank = 2,
		size_category = 3,
		open_door = true,
		resolvers.sustains_at_birth(),
		resists = { [DamageType.COLD] = 80, [DamageType.FIRE] = 20, [DamageType.LIGHTNING] = 40, [DamageType.PHYSICAL] = 35, [DamageType.LIGHT] = -50, },
		poison_immune = 1,
		blind_immune = 1,
		see_invisible = 7,
		undead = 1,
		name = "barrow wight", color=colors.LIGHT_RED, image="npc/barrow_wight.png",
		resolvers.nice_tile{image="invis.png", add_mos = {{image="npc/barrow_wight.png", display_h=2, display_y=-1}}},
		desc=[[It is a ghostly nightmare of an entity.]],
		max_life = resolvers.rngavg(80,90),
		combat_armor = 10, combat_def = 8,
		resolvers.talents{ T_FLAMESHOCK={base=3, every=5, max=7}, T_LIGHTNING={base=3, every=5, max=7}, T_GLACIAL_VAPOUR={base=3, every=5, max=7},
			T_MIND_DISRUPTION={base=3, every=5, max=7},
		},
	},
}

local dread_list = {
	dread = {
		type = "undead", subtype = "ghost",
		blood_color = colors.GREY,
		display = "G",
		body = { INVEN = 10, MAINHAND=1, OFFHAND=1, BODY=1 },
		autolevel = "warriormage",
		ai = "dumb_talented_simple", ai_state = { talent_in=2, },
		stats = { str=14, dex=18, mag=20, con=12 },
		rank = 2,
		size_category = 3,
		infravision = 10,
		can_pass = {pass_wall=70},
		resists = {all = 35, [DamageType.LIGHT] = -70, [DamageType.DARKNESS] = 65},
		no_breath = 1,
		stone_immune = 1,
		confusion_immune = 1,
		fear_immune = 1,
		teleport_immune = 0.5,
		disease_immune = 1,
		poison_immune = 1,
		stun_immune = 1,
		blind_immune = 1,
		cut_immune = 1,
		see_invisible = 80,
		undead = 1,
		resolvers.sustains_at_birth(),
		name = "dread", color=colors.ORANGE, image="npc/dread.png",
		desc = [[It is a form that screams its presence against the eye. Death incarnate, its hideous black body seems to struggle against reality as the universe itself strives to banish it.]],
		level_range = {1, nil}, exp_worth = 0,
		max_life = resolvers.rngavg(90,100),
		combat_armor = 0, combat_def = resolvers.mbonus(10, 50),
		invisibility = resolvers.mbonus(5, 10),
		ai_state = { talent_in=4, },
		combat = { dam=resolvers.mbonus(45, 45), atk=resolvers.mbonus(25, 45), apr=100, dammod={str=0.5, mag=0.5} },
		resolvers.talents{
			T_BURNING_HEX={base=3, every=5, max=7},
			T_BLUR_SIGHT={base=4, every=6, max=8},
		},
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

local wight_order = {"g_wight", "b_wight"} -- Sets listing order
local dread_order = {"dread"}
local lich_order = {"lich"}

local function getWightChances(self)
	return { g_wight=50, b_wight=50 }
end

local function getDreadChances(self)
	return { dread=100 }
end

local function getLichChances(self)
	return { lich=100 }
end

local function summonWight(self, lev)
	local chances = getWightChances(self)
	local pick = rng.float(0,100)
	local tot, m = 0
	for k, e in pairs(chances) do
		tot = tot + e
		if tot > pick then
			m = k
			break
		end
	end
	m = require("mod.class.NPC").new(wight_list[m])
	m.necrotic_minion = true
	m.minion_type = "wight"
	return m
end

local function summonDread(self, lev)
	local chances = getDreadChances(self)
	local pick = rng.float(0,100)
	local tot, m = 0
	for k, e in pairs(chances) do
		tot = tot + e
		if tot > pick then
			m = k
			break
		end
	end
	m = require("mod.class.NPC").new(dread_list[m])
	m.necrotic_minion = true
	m.minion_type = "dread"
	return m
end

local function summonLich(self, lev)
	local chances = getLichChances(self)
	local pick = rng.float(0,100)
	local tot, m = 0
	for k, e in pairs(chances) do
		tot = tot + e
		if tot > pick then
			m = k
			break
		end
	end
	m = require("mod.class.NPC").new(lich_list[m])
	m.necrotic_minion = true
	m.minion_type = "lich"
	return m
end

newTalent{
	name = "Summon Wight",
	type = {"spell/terrifying-minions",1},
	require = spells_req_high1,
	points = 5,
	fake_ressource = true,
	mana = 80,
	cooldown = 20,
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
		return math.floor(self:getTalentLevel(t))
	end,
	getLevel = function(self, t)
		return math.floor(self:combatScale(self:getTalentLevel(t), -6, 0.9, 2, 5)) + math.floor(self:getTalentLevel(self.T_MINION_STRENGTH))
	end, -- -6 @ 1, +2 @ 5, +5 @ 8 + the minion strength
	MinionChancesDesc = function(self)
		local c = getWightChances(self)
		local chancelist = tstring({})
		for i, k in ipairs(wight_order) do
			if c[k] then
				chancelist:add(true,wight_list[k].name:capitalize(),(": %d%%"):format(c[k]))
			end
		end
		return chancelist:toString()
	end,
	action = function(self, t)
		-- only allow the summon if we haven't exceeded the limit
		local nb = t.getMax(self, t)
		if trueNecroGetNbSummon(self,"wight") < nb then
			local p = self:isTalentActive(self.T_TRUE_NECROTIC_AURA)
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
			local minion = summonWight(self, self:getTalentLevel(t))
			local pos = rng.tableRemove(possible_spots)
			local no_decay = math.floor(self:getTalentLevel(self.T_TRUE_AURA_MASTERY), "log") > 4 -- stop decay at level 5
			if minion and pos then
				if use_ressource then self:incSoul(-1) end
				necroSetupSummon(self, minion, pos.x, pos.y, lev, no_decay)
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
		return ([[Fires powerful undead energies through your necrotic aura, attracting wights to your cause. You can control up to %d wights. The minion will be raised within a cone that extends to the edge of your necrotic aura.
		The minions level is your level %+d.
		Each minion has a chance to be%s:%s]]):
		format(nb, lev, mm, t.MinionChancesDesc(self, t))
	end,
}

newTalent{
	name = "Summon Dread",
	type = {"spell/terrifying-minions",2},
	require = spells_req_high2,
	points = 5,
	fake_ressource = true,
	mana = 120,
	soul = function(self, t) return math.max(1, math.min(t.getMax(self, t), self:getSoul())) end,
	cooldown = 30,
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
		return math.floor(self:getTalentLevel(t))
	end, -- talent level 1-5 gives 1-5
	getLevel = function(self, t)
		return math.floor(self:combatScale(self:getTalentLevel(t), -6, 0.9, 2, 5)) + math.floor(self:getTalentLevel(self.T_MINION_STRENGTH))
	end, -- -6 @ 1, +2 @ 5, +5 @ 8
	MinionChancesDesc = function(self)
		local c = getDreadChances(self)
		local chancelist = tstring({})
		for i, k in ipairs(dread_order) do
			if c[k] then
				chancelist:add(true,dread_list[k].name:capitalize(),(": %d%%"):format(c[k]))
			end
		end
		return chancelist:toString()
	end,
	action = function(self, t)
		-- only allow the summon if we haven't exceeded the limit
		local nb = t.getMax(self, t)
		if trueNecroGetNbSummon(self,"dread") < nb then
			local p = self:isTalentActive(self.T_TRUE_NECROTIC_AURA)
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
			local minion = summonDread(self, self:getTalentLevel(t))
			local pos = rng.tableRemove(possible_spots)
			local no_decay = math.floor(self:getTalentLevel(self.T_TRUE_AURA_MASTERY), "log") > 4 -- stop decay at level 5
			if minion and pos then
				if use_ressource then self:incSoul(-1) end
				necroSetupSummon(self, minion, pos.x, pos.y, lev, no_decay)
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
		return ([[Fires powerful undead energies through your necrotic aura, forcing an ancient spectre to your cause. You can control up to %d dreads. The minion will be raised within a cone that extends to the edge of your necrotic aura.
		The minion's level is your level %+d.
		Each minion has a chance to be%s:%s]]):
		format(nb, lev, mm, t.MinionChancesDesc(self, t))
	end,
}

newTalent{
	name = "Summon Lich",
	type = {"spell/terrifying-minions",3},
	require = spells_req_high3,
	points = 5,
	fake_ressource = true,
	mana = 250,
	soul = function(self, t) return math.max(1, math.min(t.getMax(self, t), self:getSoul())) end,
	cooldown = 60,
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
		return math.floor(self:getTalentLevel(t))
	end,
	getLevel = function(self, t)
		return math.floor(self:combatScale(self:getTalentLevel(t), -6, 0.9, 2, 5)) + math.floor(self:getTalentLevel(self.T_MINION_STRENGTH))
	end, -- -6 @ 1, +2 @ 5, +5 @ 8
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
		-- only allow the summon if we haven't exceeded the limit
		local nb = t.getMax(self, t)
		if trueNecroGetNbSummon(self,"lich") < nb then
			local p = self:isTalentActive(self.T_TRUE_NECROTIC_AURA)
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
			local minion = summonLich(self, self:getTalentLevel(t))
			local pos = rng.tableRemove(possible_spots)
			local no_decay = math.floor(self:getTalentLevel(self.T_TRUE_AURA_MASTERY), "log") > 4 -- stop decay at level 5
			if minion and pos then
				if use_ressource then self:incSoul(-1) end
				necroSetupSummon(self, minion, pos.x, pos.y, lev, no_decay)
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
		return ([[Fires powerful undead energies through your necrotic aura, coercing a lich to accompany you. You can control up to %d liches. The minion will be raised within a cone that extends to the edge of your necrotic aura.
		The minion's level is your level %+d.
		Each minion has a chance to be%s:%s]]):
		format(nb, lev, mm, t.MinionChancesDesc(self, t))
	end,
}
