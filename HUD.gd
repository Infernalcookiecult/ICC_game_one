extends CanvasLayer


signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
	
func update_score(score):
	$Score.text = str(score)
	

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
	
	
	

func new_game():
	pass # replace with function body


func _on_MessageTimer_timeout():
	$Message.hide()
