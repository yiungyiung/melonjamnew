extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$count.text="Crystal Count: "+str( .crystalcount)
	$score.text="Score: "+str(.score)
	
	
	

func _on_play_button_down():
	pass# Replace with function body.


func _on_home_pressed():
	pass # Replace with function body.

