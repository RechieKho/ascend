# Game Design Document
As the one-line description said, it is a maze-generating metroidvania game.

It is about a tortoise wanderers travel across the vast, never-ending world,
in search of honing its skill to the extreme. The game will be a randomized 
metroidvania, or roguelike that never resets, mixing of generated levels and
exploration & progression. This game is currently targeted to be a *desktop*,
*singleplayer* game (no multiplayer, no multiplatform yet; go away feature
freaks).


### Gameplay / Mechanics
#### Levels
The game composes of infinite number of generated level. Each level has its own 
biome and unique enemies. In a level, there will be a boss enemy for the player 
to defeat in order to proceed to the next level. The map of the level will be 
vast so the player will need to venture and explore the terrain to hunt down the 
boss enemy. 

#### Player's control
The player can move like a normal 2D platformer (walks left & right, single
jump). The player can also do basic attack for all 4 direction (up, down, left
and right). Hitting enemies, projectiles and some terrain downward sends the 
player upward.

#### Health
The player will have interger amount of health and damage received will cost 1
to 3 health depending on the damage. The player can use mana to restore health
through focusing.

Since the levels are vast, there will be checkpoints scattered across the level.
On death, player will be respawned to the last checkpoint.

#### Mana
Hitting enemies or some special object gains mana. The player will no longer receive
mana if the mana is maxed out. 

#### Skills
For each level passed, the player will grant a new skill. There will have a
skill system in which the player can defines its moveset (or skill set) from the
list of skills acquired from defeating bosses. Each skill will have its own
cooldown and mana cost. The player can only edit moveset at the checkpoints.


If you have any uncertainty or suggestion, please [open an issue](https://github.com/RechieKho/ascend/issues).
