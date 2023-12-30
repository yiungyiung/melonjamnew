extends RigidBody2D

var timebefore_delete=5.0
var timer=0.0


# Called when the node enters the scene tree for the first time.
func _ready():
	var timer=0 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer+=delta
	if timer>=timebefore_delete:
		queue_free()
	var col=get_colliding_bodies()
	for i in col:
		if i.is_in_group("player"):
			i.health-=10
			print(i.health)
			queue_free()
