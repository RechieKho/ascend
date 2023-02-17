extends Control

onready var health_bar := $Health/HealthBar as ProgressBar
onready var health_txt := $Health/HealthTxt as Label

onready var mana_bar := $Mana/ManaBar as ProgressBar
onready var mana_txt := $Mana/ManaTxt as Label

onready var hitbox := $"../../Hitbox" as Hitbox
onready var mana := $"../../Mana" as Mana

func _init():
	set_as_toplevel(true)

func _process(delta):
	if health_bar.max_value != hitbox.max_hitpoints:
		health_bar.max_value = hitbox.max_hitpoints
	health_bar.value = hitbox.hitpoints
	health_txt.text = "{0}/{1}".format([hitbox.hitpoints, hitbox.max_hitpoints])
	
	if mana_bar.max_value != mana.max_mana:
		mana_bar.max_value = mana.max_mana
	mana_bar.value = mana.mana
	mana_txt.text = "{0}/{1}".format([mana.mana, mana.max_mana])
