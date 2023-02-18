extends Node2D

## Punching bag
## A dev tool for testing damage output

onready var hitbox := $Hitbox as Hitbox
onready var hitpoint_indicator := $HitpointIndicator as Label

var _total_dmg: int = 0

func _ready():
	hitpoint_indicator.text = ''

func _on_Hitbox_on_hit(new_hitpoint, impulse):
	var diff = new_hitpoint - hitbox.max_hitpoints
	_total_dmg -= diff
	hitpoint_indicator.text = str(diff)
	print(
		'{0} / {1}   {2}({3})   {4}ms'.format(
			[diff, _total_dmg, name, get_instance_id(), OS.get_ticks_msec()]
		)
	)
	hitbox.hitpoints = hitbox.max_hitpoints
