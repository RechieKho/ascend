extends Node
class_name Mana


export(int, 0, 1000) var max_mana := 100

var mana: int = max_mana setget set_mana

signal on_mana_changed(new_mana)

func _ready():
	connect("on_mana_changed", self, "debug")

func debug(mana):
	print("player_mana: ", mana)

func set_mana(value):
	if mana == value: return
	mana = clamp(value, 0, max_mana)
	emit_signal("on_mana_changed", mana)
