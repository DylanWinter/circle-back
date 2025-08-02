extends Node

func _process(delta: float) -> void:
	if GameManager.start_meeting_early:
		SceneTransition.change_scene("res://meeting.tscn")
