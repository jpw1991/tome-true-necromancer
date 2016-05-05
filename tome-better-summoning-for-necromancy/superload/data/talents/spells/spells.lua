
local _M = loadPrevious(...)

-- Necromancer spells
newTalentType {
  allow_random=true,
  no_silence=true,
  is_spell=true,
  mana_regen=true,
  type="spell/necrotic-mastery",
  name = "necrotic mastery",
  description = "Increase the quality of your undead minions."
}

newTalentType {
  allow_random=true,
  no_silence=true,
  is_spell=true,
  mana_regen=true,
  type="spell/skeletal-minions",
  name = "skeletal minions",
  description = "Create skeleton minions."
}

load("/data/talents/spells/necrotic-mastery.lua")
load("/data/talents/spells/skeletal-minions.lua")

return _M
