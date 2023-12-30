extends Area2D

var manager
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

 # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.crystalcount+=1
		print(body.crystalcount)
		manager.farbar()
		queue_free()# Replace with function body.
