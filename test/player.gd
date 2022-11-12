extends Area2D

var speed = 75
export(int) var susLevleHere = 1
var susLevleTwo = susLevleHere

func _physics_process(delta):
	var velocity = Vector2(
		int(Input.get_action_strength("move_right")) - int(Input.get_action_strength("move_left")),
		int(Input.get_action_strength("down")) - int(Input.get_action_strength("jump"))
	)
	position += velocity * delta * speed




func _on_Area2D_area_entered(area):
	var _timer = Timer.new()
	add_child(_timer)
	
	_timer.connect("timeout",self,"sus_update")
	_timer.set_wait_time(1.0)
	_timer.set_one_shot(false)
	_timer.start()
	print(susLevleHere)
	pass # Replace with function body.

func sus_update():
	susLevleHere += 1
	$SusP.set_percent_value_int(susLevleHere)
