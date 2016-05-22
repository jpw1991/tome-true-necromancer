local class = require"engine.class"
local ActorTalents = require "engine.interface.ActorTalents"
local ActorTemporaryEffects = require "engine.interface.ActorTemporaryEffects"
local Birther = require "engine.Birther"
local DamageType = require "engine.DamageType"


class:bindHook("ToME:load", function(self, data)
	ActorTalents:loadDefinition("/data-truenecromancer/talents/spells/spells.lua")
	Birther:loadDefinition("/data-truenecromancer/birth/classes/mage.lua")
end)
