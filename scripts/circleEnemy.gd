extends RigidBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var col=get_colliding_bodies()
	for i in col:
		if i.is_in_group("player"):
			i.redhealth(10)
			queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("body_exited")
	queue_free() # Replace with function body.
