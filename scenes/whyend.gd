extends Node2D
var gameover
var score
var charm
var levelstarter=preload("res://scenes/levelstarter.tscn")
var home= preload("res://scenes/menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/end/Gameover.text=gameover
	$Control/end/count.text="X"+str(charm)
	$Control/end/score.text="Score: "+str(score)
	
	
	
	

func _on_play_button_down():
	$AudioStreamPlayer2D.playing=true
	var sp=levelstarter.instantiate()
	get_tree().get_root().get_node("main").add_child(sp)
	$".".queue_free()


func _on_home_pressed():
	$AudioStreamPlayer2D.playing=true
	var sp=home.instantiate()
	get_tree().get_root().get_node("main").add_child(sp)
	$".".queue_free()
 # Replace with function body.
