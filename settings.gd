extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("escape") and get_tree().paused == false:
		get_tree().paused = true
		visible = true
		
	elif Input.is_action_just_pressed("escape") and get_tree().paused == true:
		get_tree().paused = false
		visible = false


func _on_exit_pressed() -> void:
	get_tree().paused = false
	visible = false


func _on_h_slider_value_changed(value: float) -> void:
	var db = value
	
	if db <=-30.0:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"),true)
	
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"),false)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), db)
		
		


func _on_soundfx_slider_value_changed(value: float) -> void:
	var db = value
	
	if db <=-30.0:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("SoundFX"),true)
	
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("SoundFX"),false)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SoundFX"), db)


func _on_music_slider_value_changed(value: float) -> void:
	var db = value
	
	if db <=-30.0:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"),true)
	
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"),false)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), db)
