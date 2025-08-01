extends CanvasLayer

@export var timer : float = 120.0
@onready var label = $Control/Timer

func _process(delta: float) -> void:
	if not GameManager.is_in_conversation:
		timer -= delta
	var minutes : int = int(timer) / 60
	var seconds : int = int(timer) % 60
	label.text = "%01d:%02d" % [minutes, seconds]
	GameManager.timerMinutes = minutes
	GameManager.timerSeconds = seconds
	
	if (timer <= 0.0):
		SceneTransition.change_scene("res://meeting.tscn")
