extends RigidBody2D

var player 
var effect_scene=preload("res://scenes/particle.tscn")
var time=2
var effect

func particle(color):
	effect=effect_scene.instantiate()
	effect.position=position
	effect.color=color
	effect.emitting=true
	add_child(effect)
func _ready():
	pass 
	
func _process(delta):
	var direction = (player.global_position - position).normalized()
	move_and_collide(direction)
	var col=get_colliding_bodies()
	for i in col:
		if i.is_in_group("player"):
			particle(Color.RED)
			i.health-=10
			print(i.health)
			queue_free()
