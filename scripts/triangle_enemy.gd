extends RigidBody2D

var player 

func _ready():
	pass 
	
func _process(delta):
	var direction = (player.global_position - position).normalized()
	move_and_collide(direction)
	
