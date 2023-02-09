extends Timer


signal on_healing_started
signal on_healing_stopped
signal on_healing_completed

export(NodePath) var hitbox_path := "../Hitbox"
export(int, 1, 2) var heal_amount := 1

onready var hitbox := get_node(hitbox_path) as Hitbox

func _ready():
	connect("timeout", self, "on_healing_completed")

func _unhandled_input(event):
	if event.is_action_pressed("HEALING"): 
		emit_signal("on_healing_started")
		start()
		get_tree().set_input_as_handled()
	elif event.is_action_pressed("HEALING"): 
		if not is_stopped(): emit_signal("on_healing_stopped")
		stop()
		get_tree().set_input_as_handled()

func on_healing_completed():
	hitbox.hitpoints += heal_amount
	emit_signal("on_healing_completed")
