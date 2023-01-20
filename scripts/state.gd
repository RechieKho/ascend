extends Node
class_name State


var c # context
var active := false setget set_active

func _ready():
	set_active(false)

func set_active(value: bool):
	if active == value: return
	set_process(value)
	set_physics_process(value)
	set_process_unhandled_input(value)
	active = value

func enter_state():
	pass

func exit_state():
	pass
