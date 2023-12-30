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
	get_tree().get_root().add_child(effect)
func _ready():
	pass 
	
func _process(delta):
	var direction = (player.global_position - position).normalized()
	move_and_collide(direction)
	var col=get_colliding_bodies()
	for i in col:
		if i.is_in_group("player"):
			particle(Color.RED)
			i.redhealth(10)
			queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free() # Replace with function body.
