extends StaticBody2D


const SPEED = 400.0


func _physics_process(delta: float) -> void:
	var move = 0
	if Input.is_action_pressed("ui_up"):
		move -= 1
	elif Input.is_action_pressed("ui_down"):
		move += 1
	
	position.y += move * SPEED * delta
