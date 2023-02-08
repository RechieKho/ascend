extends Area2D

export var pickable: bool = true
export (int, 0, 100) var mana := 10

func _ready():
	connect("body_entered", self, "on_body_entered")

func on_body_entered(body: PhysicsBody2D):
	if pickable and body.is_in_group("PLAYER"):
		# Don't pick item if mana is maxed out
		if body.mana_system.mana < body.mana_system.max_mana:
			body.mana_system.mana += mana
			destroy_item()

func destroy_item():
	# Run animation or effects...
	pickable = false
	queue_free()
