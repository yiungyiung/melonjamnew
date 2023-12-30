extends Control


var Dseconds=30
var Dminutes=1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Dseconds-=delta
	
	$Label.text="Time left: %0.2f"%(Dseconds)
	$charm_count.text=str($"../Player".crystalcount)+" X "
	$score.text="Score: "+str($"../Player".score)
	
	
	
	
	


