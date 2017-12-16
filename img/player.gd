extends KinematicBody2D

#laws of physics
const GRAVITY = Vector2(0, 1000)

#Player Movement Constants
const FLOOR_NORMAL   = Vector2(0, -1)
const SLOPE_FRICTION = 20
const MOVEMENT_SPEED = 600
const ACCELERATION   = 1
const JUMP_FORCE     = 600

#Player variables
var velocity = Vector2(0,0)
var can_jump = false
var jump_count = 2




func _ready():
	pass
	
func _physics_process(delta):
	velocity += GRAVITY * delta
	
	velocity = move_and_slide(velocity,FLOOR_NORMAL, SLOPE_FRICTION)
	
	if is_on_floor():
		jump_count = 2
	
	
	var movement = 0
	
	if Input.is_action_pressed("ui_right"):
		movement += 1
		
	if Input.is_action_pressed("ui_left"):
		movement -= 1
		
	movement *= MOVEMENT_SPEED
	
	velocity.x = lerp(velocity.x, movement, ACCELERATION)
	
	if jump_count > 0 && Input.is_action_just_pressed("ui_up"):
		velocity.y = 0
		velocity.y -= JUMP_FORCE
	
		
	

