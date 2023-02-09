# Game Design Document
As the one-line description said, it is a maze-generating metroidvania game.

It is about a tortoise wanderers travel across the vast, never-ending world,
in search of honing its skill to the extreme. The game will be a randomized 
metroidvania, or roguelike that never resets, mixing of generated levels and
exploration & progression. This game is currently targeted to be a *desktop*,
*singleplayer- game. Do note that it is always open for suggestion at [our github
issues page](https://github.com/RechieKho/ascend/issues).


### Gameplay / Mechanics
#### Levels
The game composes of infinite number of generated level. Each level has its own 
biome and unique enemies. In a level, there will be a boss enemy for the player 
to defeat in order to proceed to the next level. The map of the level will be 
vast so the player will need to venture and explore the terrain to hunt down the 
boss enemy. 

#### Player's control
Initially, there will be keys bind to these inputs:

- `Left`
- `Right`
- `Up`
- `Down`
- `Jump`
- `Dash`
- `Heal` (holding down the key)
- `Basic attack`
- `Skill cast 1`
- `Skill cast 2`

When editing moveset, the player can bind to these keys (combination):

- `Skill Cast N`
- `Up` + `Skill Cast N`
- `Down` + `Skill Cast N`
- `Dash` + `Skill Cast N`

Where N in `Skill Cast N` is either `1` or `2`. The rest of the keys (combination) will
be reserved and cannot be bind to any skill (for instances, `Left` key will only move to left).

The player can move like a normal 2D platformer (walks left & right using `Left` &
right key, single jump with `Jump` key):

- Walk to left (`Left` key)
- Walk to right (`Right` key)
- Jump (`Jump` key)

The player can look up or down (move the viewport up or down):

- Look up (Holding `Up` key)
- Look down (Holding `Down` key)

The player can interact with NPC or pickable item using `Up` key.

The player can also do basic attack for all 4 direction:

- Attack direction the player is facing (`Basic attack` key)
- Attack upward (`Up` key + `Basic attack` key)
- Attack downward (`Down` key + `Basic attack` key)

Hitting enemies, projectiles and some terrain downward sends the player upward.

#### Inventory system
After you pick up a pickable item, it will be stored in this inventory system. 
The item stored will be used to do quest and unlock special interaction with NPC.

#### Health
The player will have interger amount of health and damage received will cost 1
to 3 health depending on the damage. The player can use mana to restore health
through healing (holding `Heal` key).

Since the levels are vast, there will be checkpoints scattered across the level.
On death, player will be respawned to the last checkpoint. The player will lost
part of the items in the inventory system. There will left a shell at the location 
the player died, in which the player can collect back the items by breaking the
shell.

#### Mana
Hitting enemies or some special object gains mana. The player will no longer receive
mana if the mana is maxed out. 

#### Skills
For each level passed, the player will grant a new skill. There will have a
skill system in which the player can defines its moveset (or skill set) from the
list of skills acquired from defeating bosses. Each skill will have its own
cooldown and mana cost. The player can only edit moveset at the checkpoints.

By editing moveset, the player can bind certain key input or key input combination
to the skill obtained.


If you have any uncertainty or suggestion, please [open an issue](https://github.com/RechieKho/ascend/issues).
