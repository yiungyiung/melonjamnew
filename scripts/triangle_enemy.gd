extends RigidBody2D

var player 

func _ready():
	pass 
	
func _process(delta):
	var direction = (player.global_position - position).normalized()
	move_and_collide(direction)
	var col=get_colliding_bodies()
	for i in col:
		if i.is_in_group("player"):
			i.health-=10
			print(i.health)
			queue_free()
