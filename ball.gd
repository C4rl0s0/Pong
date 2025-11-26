extends RigidBody2D

const SPEED = 600.0

var last_collision_time := 0.0

func _ready():
	var direction = Vector2(randf_range(-1, 1), randf_range(-0.2, 0.2)).normalized()
	linear_velocity = direction * SPEED

func _integrate_forces(state):
	if linear_velocity.length() != 0:
		linear_velocity = linear_velocity.normalized() * SPEED


func _on_body_shape_entered(body_rid: RID, body: Node, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Paddle":
		if Time.get_ticks_msec() - last_collision_time > 50:
			Global.score += 1
		last_collision_time = Time.get_ticks_msec()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	get_tree().change_scene_to_file("res://GameOver.tscn")
	Global.reset()
