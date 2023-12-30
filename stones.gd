extends Area2D

var manager
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

 # Replace with function body.

var effect_scene=preload("res://scenes/particle.tscn")
var time=2
var effect

func particle(color):
	effect=effect_scene.instantiate()
	effect.position=global_position
	effect.color=color
	effect.emitting=true
	get_tree().get_root().add_child(effect)
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.increasescore(50)
		#print(body.crystalcount)
		body.crystalcount+=1
		print(body.crystalcount)
		manager.farbar()
		particle(Color.DARK_GOLDENROD)
		queue_free()# Replace with function body.
