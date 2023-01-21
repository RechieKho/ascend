extends Area2D
class_name Hurtbox


export(int, 0, 10) var hurtpoints := 5

func hurt():
	for hitbox in get_overlapping_areas():
		if not hitbox is Hitbox: continue
		hitbox.hitpoints -= hurtpoints
