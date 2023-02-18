extends KinematicBody2D


export(float, 0.0, 1.0) var walk_lerp_weight := 0.5
export(float, 0.0, 1000.0) var speed := 500.0
export(float, 0.0, 10000.0) var jump_power := 1500.0
export(float, 0.0, 1.0) var jump_release_multiplier := 0.5
export(float, 0.0, 1000.0) var gravity := 100.0

onready var animation_tree := $AnimationTree as AnimationTree
onready var graphics := $Graphics as Node2D
onready var listener := $Listener2D as Listener2D

onready var on_ground_state := $States/OnGround as State
onready var on_air_state := $States/OnAir as State

onready var hitbox := $Hitbox as Hitbox
onready var mana_system := $Mana as Mana

onready var basic_attack_hurtbox := $Graphics/Root/Staff/BasicAttackHurtbox as Hurtbox

var current_state: State setget set_current_state
var linear_velocity: Vector2

func _ready():
	on_ground_state.c = self
	on_air_state.c = self
	set_current_state(on_air_state)
	animation_tree.active = true

func _process(delta):
	var input_axis := Input.get_axis("LEFT", "RIGHT")
	if input_axis < 0: graphics.scale.x = -abs(graphics.scale.x)
	elif input_axis > 0: graphics.scale.x = abs(graphics.scale.x)

func _physics_process(delta):
	# apply velocity
	linear_velocity = move_and_slide(linear_velocity, Vector2.UP)

func set_current_state(value: State):
	if current_state == value: return
	if current_state: current_state.active = false
	value.enter_state()
	value.active = true
	current_state = value

func _input(event):
	if hitbox.hitpoints <= 0:
			return
	
	var current_anim = animation_tree.get("parameters/attacks/playback").get_current_node() as String
	if not (current_anim.empty() or current_anim == 'RESET'):
		return
	
	if event.is_action("BASIC_ATTACK") and !event.is_action_pressed("BASIC_ATTACK"):
		animation_tree.set("parameters/attack_trigger/active", true)
		if Input.is_action_pressed("UP"):
			animation_tree.get("parameters/attacks/playback").travel("BASIC ATTACK UP")
		elif Input.is_action_pressed("DOWN"):
			animation_tree.get("parameters/attacks/playback").travel("BASIC ATTACK DOWN")
		else:
			animation_tree.get("parameters/attacks/playback").travel("BASIC ATTACK FORWARD")


func _on_BasicAttackHurtbox_area_entered(area: Area2D):
	if is_a_parent_of(area): return
	if not area is Hitbox: return
	basic_attack_hurtbox.hurt(area)
