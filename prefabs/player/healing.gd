extends Node


export var is_healing: bool = false
export(int, 0, 100) var mana_cost := 5
export(float, 0, 100) var healing_timeout := 1.25
export(int, 0, 100) var healing_points := 10
export(NodePath) var subject_path := "../"

onready var timer := $Timer as Timer
onready var subject := get_node(subject_path) as Node2D

func _ready():
	timer.wait_time = healing_timeout
	timer.connect("timeout", self, "handle_timeout")

func stop_healing():
	is_healing = false
	timer.stop()

func start_healing():
	if !is_healing and subject.hitbox.hitpoints < subject.hitbox.max_hitpoints:
		is_healing = true
		timer.start()

func handle_timeout():
	if is_healing:
		subject.hitbox.hitpoints += healing_points
		subject.mana_system.mana -= mana_cost
		stop_healing()

func _process(delta):
	if Input.is_action_just_pressed("HEALING") and !is_healing:
		start_healing()
	if  Input.is_action_just_released("HEALING") and is_healing:
		stop_healing()
