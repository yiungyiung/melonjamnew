extends RigidBody2D

func addimpulse(direction,forced) -> void:
	apply_central_impulse(direction.normalized()*forced)

func _process(delta):
	var col=get_colliding_bodies()
	for i in col:
		if i.is_in_group("damagers"):
			i.queue_free()
			queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
