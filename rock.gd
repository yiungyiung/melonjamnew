extends RigidBody2D

var timebefore_delete=3.0
var timer=0.0


# Called when the node enters the scene tree for the first time.
func _ready():
	var timer=0 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer+=delta
	if timer>=delta:
		queue_free()
