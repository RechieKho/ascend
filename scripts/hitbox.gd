extends Area2D
class_name Hitbox


signal on_dead
signal on_hit(new_hitpoint, impulse)

export(int, 0, 100) var max_hitpoints := 10
export(NodePath) var subject_path := "../"

onready var subject := get_node(subject_path) as Node2D
onready var hitpoints = max_hitpoints setget set_hitpoints

func set_hitpoints(value: int):
	if hitpoints == value: return
	hitpoints = clamp(value, 0, max_hitpoints)
	if hitpoints == 0: emit_signal("on_dead")

func hit(amount: int, impulse: Vector2):
	set_hitpoints(hitpoints - amount)
	emit_signal("on_hit", hitpoints, impulse)
