extends Node
class_name Mana


export(int, 0, 1000) var max_mana := 100

var mana: int = max_mana setget set_mana

signal on_mana_changed(new_mana)

func _ready():
	connect("on_mana_changed", self, "debug")

func debug(value: int):
	print("player_mana: ", value)

func set_mana(value: int):
	if mana == value: return
	mana = clamp(value, 0, max_mana) as int
	emit_signal("on_mana_changed", mana)
