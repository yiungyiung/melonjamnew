extends ParallaxBackground
var timer=4
var startscene= preload("res://scenes/level2.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer-=delta
	scroll_base_offset-=Vector2(100,0)*delta
	if(timer-1<1):
		$"../Control/Label".text="Start!"
	else:
		$"../Control/Label".text=str(round(timer-1))
	if(timer-1<0):
		print("Startgame")
		var sp=startscene.instantiate()
		get_tree().get_root().get_node("main").add_child(sp)
		$"..".queue_free()
