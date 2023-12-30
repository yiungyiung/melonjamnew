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
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var col=get_colliding_bodies()
	for i in col:
		if i.is_in_group("player"):
			particle(Color.RED)
			i.redhealth(10)
			queue_free()
	var direction = (player.global_position- global_position).normalized()
	direction.y = 0
	apply_central_impulse(direction*25)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free() # Replace with function body.
