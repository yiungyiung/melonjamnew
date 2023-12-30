extends Control

var endscene=preload("res://scenes/end.tscn")
var Dseconds=45
var Dminutes=1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Dseconds-=delta
	if(Dseconds<0):
		var spaner=endscene.instantiate()
		spaner.gameover="Time's Up"
		spaner.score=$"../Player".score
		spaner.charm=$"../Player".crystalcount
		get_tree().get_root().get_node("main").add_child(spaner)
		var object=get_tree().get_nodes_in_group("damagers")
		for i in object:
			i.queue_free()
		$"..".queue_free()
	$Label.text="Time left: %0.2f"%(Dseconds)
	$charm_count.text=str($"../Player".crystalcount)+" X "
	$score.text="Score: "+str($"../Player".score)
	
	
	
	
	


