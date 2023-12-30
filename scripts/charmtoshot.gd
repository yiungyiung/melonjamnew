extends RigidBody2D

func addimpulse(direction,forced) -> void:
	apply_central_impulse(direction.normalized()*forced)

var effect_scene=preload("res://scenes/particle.tscn")
var time=2
var effect
var player
var explosioneffect
func particle(color):
	effect=effect_scene.instantiate()
	effect.position=position
	effect.color=color
	effect.emitting=true
	get_tree().get_root().add_child(effect)
func _process(delta):
	var col=get_colliding_bodies()
	for i in col:
		if i.is_in_group("damagers"):
			particle(Color.BLUE)
			player.increasescore(10)
			explosioneffect.playing=true
			i.queue_free()
			queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
