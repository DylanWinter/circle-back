extends Node2D

func _ready():
	GameManager.reset_loop()
	Music.switch("chill")
	

var playerNear = false
func _process(delta: float) -> void:
	#print(GameManager.wordFoundDict["RDC - Rival Demonic Company"])
	print(AudioServer.get_bus_volume_db(0))
	pass
