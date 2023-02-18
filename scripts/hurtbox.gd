extends Area2D
class_name Hurtbox


export(int, 0, 10) var hurtpoints := 5
export(float, 0, 10000) var impulse_magnitude := 200
export(NodePath) var subject_path := "../"

onready var subject := get_node(subject_path) as Node2D

func hurt_all():
	for hitbox in get_overlapping_areas():
		if not hitbox is Hitbox: continue
		hurt(hitbox)

func hurt(hitbox: Hitbox):
	if not hitbox is Hitbox: return
	var impulse = (hitbox.subject.global_position - subject.global_position) \
		.normalized() * impulse_magnitude
	hitbox.hit(hurtpoints, impulse)
