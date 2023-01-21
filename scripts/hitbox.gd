extends Area2D
class_name Hitbox


signal on_dead
signal on_hitpoint_changed(new_hitpoint)

export(int, 0, 100) var max_hitpoints := 10

onready var hitpoints = max_hitpoints setget set_hitpoints

func set_hitpoints(value: int):
	if hitpoints == value: return
	hitpoints = clamp(value, 0, max_hitpoints)
	emit_signal("on_hitpoint_changed", hitpoints)
	if hitpoints == 0: emit_signal("on_dead")
