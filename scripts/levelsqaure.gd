extends Node2D

@export var rottimer:float
var angle : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rottimer=5
	angle=0
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rottimer -= delta
	if(rottimer<=0):
		angle=deg_to_rad(randf_range(0,360))
		rottimer=5
	var rot= lerp_angle(rotation,angle,0.05)
	rotation=rot
