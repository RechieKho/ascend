tool
extends Area2D
class_name Hurtbox

export(int, 0, 10) var hurtpoints := 5
export(float, 0, 10000) var impulse_magnitude := 200
export(Shape2D) var shape = null setget set_shape
export(NodePath) var subject_path := "../"

onready var subject := get_node(subject_path) as Node2D
onready var collision = $CollisionShape2D as CollisionShape2D

func set_shape(value):
	shape = value
	if collision: collision.shape = shape

func _ready():
	collision.shape = shape

func hurt():
	for hitbox in get_overlapping_areas():
		if not hitbox is Hitbox: continue
		var impulse = (hitbox.subject.global_position - subject.global_position) \
			.normalized() * impulse_magnitude
		hitbox.hit(hurtpoints, impulse)
