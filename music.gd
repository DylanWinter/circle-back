extends Node

@export var Chill = load("res://assets/ChillOffice.wav")
@export var Boss = load("res://assets/ThePresentation.wav")
var curr = "chill"

func _ready() -> void:
	$AudioStreamPlayer.stream = Chill
	$AudioStreamPlayer.play()
	
func switch(track : String):
	if (track == "chill" and curr != "chill"):
		curr = track
		$AudioStreamPlayer.stop()
		$AudioStreamPlayer.stream = Chill
		$AudioStreamPlayer.play()
	elif (track == "boss" and curr != "boss"):
		curr = track
		$AudioStreamPlayer.stop()
		$AudioStreamPlayer.stream = Boss
		$AudioStreamPlayer.play()
