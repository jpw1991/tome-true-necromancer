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

local Particles = require "engine.Particles"

newBirthDescriptor{
	type = "subclass",
	name = "TrueNecromancer",
	locked = function() return profile.mod.allow_build.mage_necromancer end,
	locked_desc = "The road to necromancy is a macabre path indeed. Walk with the dead, and drink deeply of their black knowledge.",
	desc = {
		"True Necromancers differentiate themselves from normal necromancers by having",
		" great armies at the cost of their own power. Unlike other necromancers, true",
		" necromancers have few attacks of their own and those that they do possess are",
		" weak. A true necromancer's weapon is their army, over which they have supreme",
		" control.",
		"Their most important stats are: Magic and Willpower",
		"#GOLD#Stat modifiers:",
		"#LIGHT_BLUE# * +0 Strength, +0 Dexterity, +1 Constitution",
		"#LIGHT_BLUE# * +5 Magic, +3 Willpower, +0 Cunning",
		"#GOLD#Life per level:#LIGHT_BLUE# -3",
	},
	power_source = {arcane=true},
	stats = { mag=5, wil=3, con=1, },
	talents_types = {
		["spell/conveyance"]={true, 0.2},
		["spell/divination"]={true, 0.2},
		["spell/dark-mastery"]={true, 0.3},
		["spell/skeletal-minions"]={true, 0.3},
		["spell/fleshy-minions"]={true, 0.3},
		--["spell/advanced-necrotic-minions"]={false, 0.3},
		--["spell/shades"]={false, 0.3},
		["spell/necrosis"]={true, 0.3},
		--["spell/nightfall"]={true, 0.3},
		--["spell/grave"]={true, 0.3},
		--["spell/animus"]={true, 0.3},
		["cunning/survival"]={true, -0.1},
	},
	unlockable_talents_types = {
		["spell/ice"]={false, 0.2, "mage_cryomancer"},
	},
	birth_example_particles = {
		"necrotic-aura",
		function(actor)
			if core.shader.active(4) then local x, y = actor:attachementSpot("back", true) actor:addParticles(Particles.new("shader_wings", 1, {x=x, y=y, infinite=1, img="darkwings"}))
			end
		end,
		function(actor)
			if core.shader.active(4) then
				local p1 = actor:addParticles(Particles.new("shader_ring_rotating", 1, {rotation=0, radius=1.1, img="spinningwinds_black"}, {type="spinningwinds", ellipsoidalFactor={1,1}, time_factor=6000, noup=2.0}))
				p1.toback = true
				actor:addParticles(Particles.new("shader_ring_rotating", 1, {rotation=0, radius=1.1, img="spinningwinds_black"}, {type="spinningwinds", ellipsoidalFactor={1,1}, time_factor=6000, noup=1.0}))
			else actor:addParticles(Particles.new("ultrashield", 1, {rm=0, rM=0, gm=0, gM=0, bm=10, bM=100, am=70, aM=180, radius=0.4, density=60, life=14, instop=20}))
			end
		end,
	},
	talents = {
		[ActorTalents.T_MINION_STRENGTH] = 1,
		[ActorTalents.T_TRUE_NECROTIC_AURA] = 1,
		[ActorTalents.T_SUMMON_SKELETON_WARRIORS] = 1,
		[ActorTalents.T_ARCANE_EYE] = 1,
		[ActorTalents.T_INVOKE_DARKNESS] = 1,
		[ActorTalents.T_BLURRED_MORTALITY] = 1,
	},
	copy = {
		soul = 1,
		max_life = 90,
		resolvers.equipbirth{ id=true,
			{type="weapon", subtype="staff", name="elm staff", autoreq=true, ego_chance=-1000},
--			{type="weapon", subtype="dagger", name="iron dagger", autoreq=true, ego_chance=-1000},
			{type="armor", subtype="cloth", name="linen robe", autoreq=true, ego_chance=-1000},
		},
	},
	copy_add = {
		life_rating = -3,
	},
}

getBirthDescriptor("class", "Mage").descriptor_choices.subclass.TrueNecromancer = "allow"
