extends Node2D

func _ready():
	GameManager.reset_loop()
	Music.switch("chill")

func _process(delta: float) -> void:
	#print(GameManager.wordFoundDict["RDC - Rival Demonic Company"])
	pass
	


func _on_armless_only_block_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
