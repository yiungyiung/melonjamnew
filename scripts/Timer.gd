extends Area2D

var object = preload("res://scenes/bar.tscn")
var stones = preload("res://proto.tscn")
var max = 9
var spawned = 0
var area: CollisionShape2D
var spawn_positions = []  # Store the spawn positions
var min_distance=250

# Called when the node enters the scene tree for the first time.
func _ready():
	area = $CollisionShape2D
	generateSpawnPoints()
	spawnBars()
	farbar()

# Generate spawn points within the area, avoiding collisions
func generateSpawnPoints():
	var areaBounds = area.shape.extents * 2  # Get the area bounds
	
	while spawn_positions.size() < max:
		var spawnX = randf_range(-areaBounds.x / 2, areaBounds.x / 2)
		var spawnY = randf_range(-areaBounds.y / 2, areaBounds.y / 2)
		
		var spawnPosition = Vector2(spawnX, spawnY)
		
		if !_collidesWithOtherBars(spawnPosition):
			spawn_positions.append(spawnPosition)

# Check if the spawn position collides with other bars
func _collidesWithOtherBars(position: Vector2) -> bool:
	for spawnPos in spawn_positions:
		if spawnPos.distance_to(position) < min_distance:
			return true
	return false

# Spawn bars at generated positions
func spawnBars():
	for i in range(spawn_positions.size()):
		var degree = randf_range(16,45)
		var spawner = object.instantiate()
		
		
		if randf() < 0.55:  
			degree = deg_to_rad(randf_range(45,135)) 
			spawner.rotation = degree
		else:
			degree = deg_to_rad(randf_range(0,15)) 
			spawner.rotation = degree
				
		
		
		spawner.position = spawn_positions[i]
		spawner.scale.x = randf_range(0.3, 0.5)
		add_child(spawner)
		spawned += 1
func farbar():
	var farthestDistance = 0.0
	var farpos: Vector2

	for spawner in get_children():
		var distance = spawner.position.distance_to($"../../Player".global_position)
		if distance > farthestDistance:
			farthestDistance = distance
			farpos = spawner.position
	
	var spawned = stones.instantiate()
	spawned.position= farpos
	add_child(spawned)
	print("Farthest bar from player:", farpos)
