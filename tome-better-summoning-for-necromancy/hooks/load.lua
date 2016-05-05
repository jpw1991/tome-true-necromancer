local class = require"engine.class"
local ActorTalents = require "engine.interface.ActorTalents"
local ActorTemporaryEffects = require "engine.interface.ActorTemporaryEffects"
local Birther = require "engine.Birther"
local DamageType = require "engine.DamageType"


class:bindHook("ToME:load", function(self, data)
	--DamageType:loadDefinition("/tome-better-summoning-for-necromancy/damage_types.lua")
	ActorTalents:loadDefinition("/data-bettersummoningfornecromancy/talents/spells/spells.lua")
	Birther:loadDefinition("/data-bettersummoningfornecromancy/birth/classes/mage.lua")
	--ActorTemporaryEffects:loadDefinition("/bettersummoningfornecromancy/timed-effects.lua")
end)
