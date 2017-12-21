extends RigidBody2D

export (int) var SPEED

func _ready():
	$AnimatedSprite.animation = "skeli_walk"



func _on_VisibilityNotifier2D_viewport_exited( viewport ):
	#queue_free deletes mob that leaves the screen
	queue_free()
