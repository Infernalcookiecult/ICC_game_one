extends "res://character.gd"
 
# Grounded?
var grounded = false 
 
# Jumping
var can_jump = false
var jump_time = 0
var jump_counter = 2
const TOP_JUMP_TIME = 0.1 # in seconds
 
# Start
func _ready():
    # Set player properties overriding character properties
	acceleration = 1000
	top_move_speed = 500
	top_jump_speed = 700
 
# Apply force
func apply_force(state):
    # Move Left
	if(Input.is_action_pressed("ui_left")):
		directional_force += DIRECTION.LEFT
    
    # Move Right
	if(Input.is_action_pressed("ui_right")):
        directional_force += DIRECTION.RIGHT

	#Animate the sprite when walking
	if directional_force.length() > 0:
		$AnimatedSprite.play()
		directional_force.normalized() * acceleration
     
    # Jump
	if jump_counter > 0 && Input.is_action_just_pressed("ui_up"):
		jump_counter -= 1
		directional_force += DIRECTION.UP
     
#    # While on the ground
	if(grounded):
		jump_counter = 2 
    
	#Turns the sprite based on direction of movement
	if directional_force.x != 0:
		$AnimatedSprite.flip_h = directional_force.x < 0
		$AnimatedSprite.animation = "Walk"
	else:
		$AnimatedSprite.animation = "Idle"
 
   
# Enter Ground
func _on__body_enter( body ):
    # Get groups
	var groups = body.get_groups()

    # If we are on a solid ground
	if(groups.has("solid")):
		grounded = true


func _on_ground_check_body_entered( body ):
    # Get groups
	var groups = body.get_groups()
     
    # If we are on a solid ground
	if(groups.has("solid")):
		grounded = true
 
func _on_ground_check_body_exited( body ):
    # Get groups
    var groups = body.get_groups()
    jump_counter -= 1
    # If we are on a solid ground
    if(groups.has("solid")):
        grounded = false