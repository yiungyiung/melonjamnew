extends TextureProgressBar
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player=$"../../Player"
	#player.health_changed.connect(update)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	value=player.health
	
func update():
	pass#ue=player.currentHealth*100/player.health


func _on_player_health_changed():
	# Replace with function body.
	value=player.currentHealth*100/player.health
