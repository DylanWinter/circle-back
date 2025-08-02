extends Node

@export var Chill = load("res://assets/ChillOffice.wav")
@export var Boss = load("res://assets/ThePresentation.wav")
var curr = "chill"

func _ready() -> void:
	$AudioStreamPlayer2D.stream = Chill
	$AudioStreamPlayer2D.play()
	
func switch(track : String):
	if (track == "chill" and curr != "chill"):
		$AudioStreamPlayer2D.stop()
		$AudioStreamPlayer2D.stream = Chill
		$AudioStreamPlayer2D.play()
	elif (track == "boss" and curr != "boss"):
		$AudioStreamPlayer2D.stop()
		$AudioStreamPlayer2D.stream = Boss
		$AudioStreamPlayer2D.play()
