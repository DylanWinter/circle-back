extends Control

@onready var label = $Result
@onready var desc = $Description
@onready var sprite = $Sprite2D
@export var win_image : Texture2D
@export var loss_image : Texture2D

func _ready() -> void:
	var total = 4
	
	if GameManager.correctAnswers == total:
		label.text = "You win!"
		desc.text = "You kept your job for one more day. Is that good?"
		sprite.texture = win_image
	else:
		label.text = "Fired!"
		desc.text = "You collapsed from shame at your failure."
		sprite.texture = loss_image

func _on_restart_pressed() -> void:

	var total = 4
		
	if GameManager.correctAnswers == total:
		GameManager.full_reset()
		SceneTransition.change_scene("res://main_menu.tscn")
	else:
		GameManager.reset_loop()
		SceneTransition.change_scene("res://office.tscn")
