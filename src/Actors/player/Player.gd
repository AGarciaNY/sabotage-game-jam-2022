extends Actor


func _physics_process(delta: float) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var is_runing: = Input.get_action_strength("speedRun")
	var stop_runing: = Input.is_action_just_released("speedRun")
	if is_runing == 1.0:
		speed.x = 600
	else :
		speed.x = 300
	
	var direction: = get_direction()
	_velocity = calculate_move_velocity(_velocity, speed, direction, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	


func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 0.0
	)


func calculate_move_velocity(
		linear_velocity: Vector2, 
		speed: Vector2, 
		direction: Vector2,
		is_jump_interrupted: bool
		) -> Vector2:
	var out: = linear_velocity
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		out.y = speed.y * direction.y
	if is_jump_interrupted:
		out.y = -1.0
	return out

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
