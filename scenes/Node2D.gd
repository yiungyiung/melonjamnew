extends Node2D

var objectToSpawn = preload("res://rock.tscn")
var spawnTimer = 3.0  
var deleteTimer = 2.0  
var timeSinceLastSpawn = 0.0
var timeSinceLastDelete = 0.0

func _process(delta):
	timeSinceLastSpawn += delta
	timeSinceLastDelete += delta
	
	if timeSinceLastSpawn > spawnTimer:
		_spawnObject()
		timeSinceLastSpawn = 0.0
	
	if timeSinceLastDelete > deleteTimer:
		_deleteObjects()
		timeSinceLastDelete = 0.0

func _spawnObject():
	var newObject = objectToSpawn.instantiate()
	add_child(newObject)

	
	

func _deleteObjects():
	for child in get_children():
		if "TimerToDelete" in child.get_node_list():
			child.queue_free()
