extends RigidBody2D

var player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var col=get_colliding_bodies()
	for i in col:
		if i.is_in_group("player"):
			i.health-=10
			print(i.health)
			queue_free()
	var direction = (player.global_position- global_position).normalized()
	direction.y = 0
	apply_central_impulse(direction*20)
