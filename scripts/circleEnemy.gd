extends RigidBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var col=get_colliding_bodies()
	for i in col:
		if i.is_in_group("player"):
			i.health-=10
			print(i.health)
			queue_free()
