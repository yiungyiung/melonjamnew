extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_button_down():
	pass # Replace with function body.


func _on_tut_button_down():
	$".".visible=false
	$play.disabled=true
	$tut.disabled=true
	$"../tutorial".visible=true
	$"../tutorial/play".disabled=false
