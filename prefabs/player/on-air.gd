extends State


func enter_state():
	c.animation_tree.get("parameters/main/playback").travel("air")

func _process(delta):
	# switch state
	if c.is_on_floor(): c.current_state = c.on_ground_state
	
	# calculate horziontal velocity
	var horizontal_velocity = lerp(
		c.linear_velocity.x, 
		Input.get_axis("LEFT", "RIGHT") * c.speed,
		c.walk_lerp_weight
	)
	
	# calculate vertical velocity 
	var vertical_velocity = c.linear_velocity.y \
		* (c.jump_release_multiplier if Input.is_action_just_released("UP") else 1) \
		+ c.gravity
	
	# apply velocity
	c.linear_velocity = Vector2(horizontal_velocity, vertical_velocity)
	
	# update animation
	c.animation_tree["parameters/main/air/blend_position"] = - vertical_velocity / c.jump_power
