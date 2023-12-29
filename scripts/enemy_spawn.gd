extends Area2D

var circle_enemy= preload("res://scenes/circle_enemy.tscn")
var triangle_enemy=preload("res://scenes/triangle_enemy.tscn")
var square_enemy=preload("res://scenes/square_enemy.tscn")
var player

func spawnPos(area):
	var areaBounds=area.shape.extents*2
	var random_x=randf_range(area.position.x-(areaBounds.x / 2), areaBounds.x)
	var random_y=randf_range(area.position.y-(areaBounds.y / 2), areaBounds.y)
	var pos=Vector2(random_x, random_y)
	return pos

	
func _ready():
	var player=get_node("../Player")
	#player.connect("shape", enemy)


func _process(delta):
	pass


func enemy(charm):
	var root=get_tree().get_root()
	if(charm==0):
		var circle=circle_enemy.instantiate()
		circle.position=spawnPos($circle_spawn)
		root.add_child(circle)
	elif(charm==1):
		var square=square_enemy.instantiate()
		square.position=spawnPos($square_spawn)
		root.add_child(square)
	elif(charm==2):
		var triangle=triangle_enemy.instantiate()
		triangle.player=$"../Player"
		triangle.position=spawnPos($triangle_spawn)
		root.add_child(triangle)
		
	


func _on_player_enemyspwan(index):
	enemy(index)
