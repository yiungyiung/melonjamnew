extends Sprite2D
var starter=preload("res://scenes/levelstarter.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_button_down():
	$"../../AudioStreamPlayer2D".playing=true
	var sp=starter.instantiate()
	get_tree().get_root().add_child(sp)
	$"../..".queue_free()
	 # Replace with function body.


func _on_tut_button_down():
	$"../../AudioStreamPlayer2D".playing=true
	$".".visible=false
	$play.disabled=true
	$tut.disabled=true
	$"../tutorial".visible=true
	$"../tutorial/play".disabled=false
