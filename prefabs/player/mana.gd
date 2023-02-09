extends Node
class_name Mana


signal on_mana_changed(new_mana)

export(int, 0, 1000) var max_mana := 100

var mana: int = max_mana setget set_mana

func set_mana(value: int):
	if mana == value: return
	mana = clamp(value, 0, max_mana)
	emit_signal("on_mana_changed", mana)
