extends Control

@onready var label = $Result
@onready var desc = $Description

func _ready() -> void:
	var total = 4
	
	
	'''
	for term in GameManager.wordFoundDict:
		total += 1
		if GameManager.wordFoundDict[term]:
			correct += 1
	'''
	
	if GameManager.correctAnswers == total:
		label.text = "You win!"
		desc.text = "You kept your job for one more day. Is that good?"
	else:
		label.text = "Fired!"
		desc.text = "You collapsed from shame at your failure."

func _on_restart_pressed() -> void:
	var total = 0
	var correct = 0
	for term in GameManager.wordFoundDict:
		total += 1
		if GameManager.wordFoundDict[term]:
			correct += 1
		
	if correct == total:
		GameManager.full_reset()
		SceneTransition.change_scene("res://main_menu.tscn")
	else:
		GameManager.reset_loop()
		SceneTransition.change_scene("res://office.tscn")
