extends Node2D

var hold_time : float = 0.0
var max_hold_time : float = 0.8
var is_holding : bool = false
var charms = [preload("res://scenes/charmshooter.tscn"),preload("res://scenes/charmshootersq.tscn"),preload("res://scenes/charmshootertri.tscn")]
var canshoot: bool = true
var lastcharm
var currentcharm
var nextcharm
var tele
var originalscale 
signal shape(currentcharm)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentcharm=randi()% charms.size() # Replace with function body.
	nextcharm=randi()% charms.size()
	originalscale= $Bar.scale.x
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	#print(global_position.direction_to(get_global_mouse_position()))
	$Bar.scale.x=originalscale+ min(hold_time / max_hold_time * 100, 100)/100*originalscale
		
	if Input.is_action_pressed("shoot"):
		if(lastcharm==null) and canshoot :
			is_holding = true
			hold_time += delta
			if hold_time >= max_hold_time:
				hold_time = max_hold_time
		elif (lastcharm!=null) :
			is_holding = true
			$"..".position=lastcharm.global_position
			lastcharm.queue_free()
			canshoot=false
			lastcharm=null
			shape.emit(tele)
		
			
	else:
		if is_holding:
			print(lastcharm)
			if canshoot:
				var hold_value = min(hold_time / max_hold_time * 100, 100)
				print("Mouse released after: ", hold_time, " seconds. Hold value: ", hold_value)
				var spawner = charms[currentcharm].instantiate()
				tele=currentcharm
				currentcharm=nextcharm
				nextcharm=randi()%charms.size()
				spawner.addimpulse(global_position.direction_to(get_global_mouse_position()),hold_value*20)
				spawner.position=$Bar/Marker2D.global_position
				var root = get_tree().get_root()
				lastcharm=spawner
				root.add_child(spawner)
			print(lastcharm)
			is_holding = false
			hold_time = 0
			canshoot=true


