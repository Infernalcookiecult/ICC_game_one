extends Control
export (PackedScene) var Mob
var score

func _ready():
	randomize()
	
func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$BackgroundMusic.play()
	$StartTimer.start()
	var mob = Mob.instance
	add_child(mob)
	mob.set_linear_velocity(Vector2(mob.SPEED, 0))
	$ScoreTimer.start()
	$HUD.update_score(score)
	
	
func _on_MessageTimer_timeout():
	$Message.hide()
	
	
func game_over():	
	show_message("Game Over")
	yield($MessageTimer,"timeout")
	$StartButton.show()
	$Message.text = "Kill the\nskellies"
	$Message.show()
	$BackgroundMusic.stop()
	$ScoreTimer.stop()

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)