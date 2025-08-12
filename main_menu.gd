extends Control

func _on_play_button_pressed() -> void:
	
	var db = 0
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), db)
	SceneTransition.change_scene("res://intro.tscn")
	$AudioStreamPlayer.play()
