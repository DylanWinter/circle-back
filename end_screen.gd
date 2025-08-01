extends Control

@onready var label = $Result

func _ready() -> void:
	var total = 0
	var correct = 0
	for term in GameManager.wordFoundDict:
		total += 1
		if GameManager.wordFoundDict[term]:
			correct += 1
	
	if correct == total:
		label.text = "You win!"
	else:
		label.text = "Fired!"

func _on_restart_pressed() -> void:
	SceneTransition.change_scene("res://office.tscn")
