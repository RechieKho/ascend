extends State


func enter_state():
	c.animation_tree.get("parameters/main/playback").travel("ground")

func _unhandled_input(event):
	if event.is_action_pressed("UP"):
		c.linear_velocity += Vector2.UP * c.jump_power # jump

func _process(delta):
	# switch state
	if not c.is_on_floor(): c.current_state = c.on_air_state
	
	# calculate horziontal velocity
	var horizontal_velocity = lerp(
		c.linear_velocity.x, 
		Input.get_axis("LEFT", "RIGHT") * c.speed,
		c.walk_lerp_weight
	)
	
		# calculate vertical velocity 
	var vertical_velocity = c.linear_velocity.y + c.gravity
	
	# apply velocity
	c.linear_velocity = Vector2(horizontal_velocity, vertical_velocity)
	
	# update animation
	c.animation_tree["parameters/main/ground/blend_position"] = abs(horizontal_velocity / c.speed)
