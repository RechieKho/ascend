extends Node
class_name Health


export(int, 0, 1000) var max_health := 100

var health: int = max_health setget set_health

signal on_health_changed(new_health)

func _ready():
	connect("on_health_changed", self, "debug")

func debug(value: int):
	print("player_health: ", value)

func set_health(value: int):
	if health == value: return
	health = clamp(value, 0, max_health) as int
	emit_signal("on_health_changed", health)
