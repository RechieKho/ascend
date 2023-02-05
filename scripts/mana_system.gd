extends Node

export(int, 0, 1000) var max_mana := 100

var mana: int = max_mana setget mana_set

signal on_mana_change(next_mana, prev_mana)

func _ready():
	connect("on_mana_change", self, "test")

func mana_set(mana_value):
	var prev_mana = mana
	var next_mana = clamp(mana_value, 0, max_mana)
	mana = next_mana
	
	if next_mana != prev_mana:
		emit_signal("on_mana_change", next_mana, prev_mana)
