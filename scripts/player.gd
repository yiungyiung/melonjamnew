extends CharacterBody2D


const SPEED = 900.0
const JUMP_VELOCITY = -1000.0
signal enemyspwan(index)
@export var neggrav: int
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += neggrav * gravity * delta
	if is_on_floor():
		var normal= get_floor_normal()
		rotation=normal.angle()+deg_to_rad(90)
	if is_on_ceiling() and neggrav==-1:
		var normal = $RayCast2D.get_collision_normal()
		$CollisionShape2D.rotation=normal.angle()+deg_to_rad(90)
	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_ceiling() || is_on_floor()):
		velocity.y = neggrav* JUMP_VELOCITY
	
	var direction := Input.get_axis("left", "right")
	
	if direction:
		if(direction==-1):
			$CollisionShape2D/Icon.flip_h=false
		if(direction==1):
			$CollisionShape2D/Icon.flip_h=true
		velocity.x = direction * SPEED
	velocity.x-=velocity.x*delta*2

	move_and_slide()


func _on_shoter_shape(currentcharm):
	enemyspwan.emit(currentcharm)
	
