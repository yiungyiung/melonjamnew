extends RigidBody2D

func addimpulse(direction,forced) -> void:
	apply_central_impulse(direction.normalized()*forced)
# Called every frame. 'delta' is the elapsed time since the previous frame.
