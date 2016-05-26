# True Necromancer

This is a mod for Tales of Maj'Eyal that adds a new class to the game called
the `True Necromancer`. I was disappointed with the vanilla necromancer because
a summoning build is unfortunately quite weak. This mod seeks to address that issue.

This mod does not replace the Necromancer class. It simply adds a new class called the `True Necromancer` to the game.

## Brief Description

Unlike the vanilla Necromancer, the True Necromancer has fewer direct attacks of his own and has to rely on
his minions to deal damage. Without his minions, he is helpless and pitiful. But with them, he's terrifying.

## Install
Copy the `tome-true-necromancer` folder to your addons folder. On windows, this is something like:
`D:\SteamLibrary\steamapps\common\TalesMajEyal\game\addons`

## Features

** Warning: The following may change as I develop and balance the mod **

The class has no access to the following Necromancer talent categories:
- Animus
- Grave
- Necrotic Minions
- Nightfall
- Advanced Necrotic Minions
- Shades

These talents categories are replaced by the following ones:

| Type | Name | Locked | Talent1 | Talent2 | Talent3 | Talent4 |
| --- | --- | --- | --- | --- | --- | --- |
| Spell | Skeletal Minions | No | Summon Skeleton Warrior | Summon Skeleton Archer | Summon Skeleton Mage | Skeleton Mastery |
| Spell | Fleshy Minions | No | Summon Ghouls | Summon Vampires | Summon Golem | Fleshy Mastery |
| Spell | Dark Mastery | No | Minion Strength | True Aura Mastery | Soul Reserve | Dark Sacrifice |
| Spell | Terrifying Minions | Yes | Summon Wight | Summon Dread | Summon Lich |  |
| Spell | Dark Utility | Yes | Dark Recall | Minion Explosion | Necrotic Frenzy | Considerate Minions |

Skeleton minions tend to be of a higher quality than fleshy minions, but can only be summoned one at a time. Fleshy minions tend to be of a lower quality than skeleton minions, but they're cheaper and can be summoned in bulk.

Talent descriptions:

| Category | Talent | Description |
| --- | --- | --- |
| Skeletal Minions | Summon Skeleton Warriors | Summons a skeleton warrior (warrior capacity raised by each level). |
|  | Summon Skeleton Archers | Summon a skeleton archer (archer capacity raised by each level). |
|  | Summon Skeleton Mages | Summon a skeleton mage (mage capacity raised by each level). |
|  | Skeleton Mastery | Improves the quality of skeleton minions. |
| Fleshy Minions | Summon Ghoul | Summon a ghoul (ghoul capacity raised by each level). |
|  | Summon Vampires | Summon a vampire (vampire capacity raised by each level). |
|  | Summon Golem | Summon a bone golem (maximum of two at top level). Requires no souls, only mana. |
|  | Fleshy Mastery | Improves the quality and quantity of fleshy minions summoned (Quantity raised by 1 per level). |
| Dark Mastery | Minion Strength | Improves the level of the minions summoned by all True Necromancer summoning abilities. |
|  | True Aura Mastery | Improves the radius of the True Necrotic Aura. At max level this allows minions to survive even when outside the aura. Increases the chance of being refunded a soul when a minion dies within the aura by 15% per level. |
|  | Soul Reserve | Increases soul capacity by 5 per level. |
|  | Dark Sacrifice | A portion of the caster's life is sacrificed to generate a soul, starting at 75% at level 1 and ending at 25% at max level. |
| Dark Utility | Dark Recall | The necromancer's Shadow Tunnel ability, just renamed and put in this category. |
|  | Minion Explosion | The necromancer's Undead Explosion ability, just renamed and put in this category. |
|  | Necrotic Frenzy | The necromancer's Surge of Undeath ability, just renamed and put in this category. |
|  | Considerate Minions | The necromancer's Dark Empathy ability, just renamed and put in this category BUT with the following difference: Friendly fire protection extends to minions themselves too (no more friendly fire from mages). |

## Inspiration for the mod
I feel like there hasn't been a truly satisfying summoning experience in a game since Diablo 2.
Tales of Maj'Eyal is a masterpiece and came so close to giving me what I wanted, but even then,
not quite. So I decided to fix that.

The `Skeletal Minions` category is intended to be quality over quantity - strong, useful troops with clearly defined roles, offering a broad
spread of utility. This category is for the summoner who likes to prepare the perfect unit composition before
heading into battle. Minions of this category can only be summoned one at a time, with 14 seconds cooldown, making
replacements in the heat of battle difficult.

The `Fleshy Minions` is intended to offer less quality but more convenience. Troops can be summoned in bursts
and can therefore be replenished more easily, making investing some points in this category useful for emergency
situations.

`Terrifying Minions` is supposed to offer the necromancer expensive, yet powerful, units that can turn the
tide of a battle. As an unlockable category, it's supposed that a necromancer only unlocks this at later
levels.

## To do

- `Considerate Minions` should stop friendly fire from minions to each other.

## Known Issues/Bugs

None.
