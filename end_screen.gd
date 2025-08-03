extends Control

@onready var label = $Result
@onready var desc = $Description
@onready var sprite = $Sprite2D
@export var win_image : Texture2D
@export var loss_image : Texture2D
@export var superLossImage : Texture2D

func _ready() -> void:
	var total = 5
	
	if GameManager.correctAnswers == total:
		label.text = "TOTAL SUCCESS: GOOD END"
		desc.text = "“Wow. You actually did it?” Did you like... look up a guide? \nWell anyways, enjoy rush hour.” 5/5"
		sprite.texture = win_image
	elif GameManager.correctAnswers == 0:
		label.text = "TOTAL FAILURE: BAD END 1"
		desc.text = "You died of embarrassment. Right there. \nOn the Floor. That was more embarrassing than that one time... \nYou remember that one time. Making more work for ther Janitor... Shame on you” 0/5"
		sprite.texture = superLossImage
	else:
		label.text = "FAILURE: BAD END 2"
		desc.text = "You left the meeting room more red than your boss. \nMaybe you shouldn’t have stayed up all night painting your rock collection.” 1-4"
		sprite.texture = loss_image

func _on_restart_pressed() -> void:

	var total = 4
		
	if GameManager.correctAnswers == total:
		GameManager.full_reset()
		SceneTransition.change_scene("res://main_menu.tscn")
	else:
		GameManager.reset_loop()
		SceneTransition.change_scene("res://office.tscn")
