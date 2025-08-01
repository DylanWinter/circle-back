extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




var gapInSpeechBubbleVision = 100
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.player.global_position.x + get_window().size.x/2.0 < global_position.x - gapInSpeechBubbleVision:
		print("away")
	elif GameManager.player.global_position.x - get_window().size.x/2.0 > global_position.x + gapInSpeechBubbleVision:
		print("away")
	elif GameManager.player.global_position.y + get_window().size.y/2.0 < global_position.y - gapInSpeechBubbleVision:
		print("away")
	elif GameManager.player.global_position.y - get_window().size.y/2.0 > global_position.y + gapInSpeechBubbleVision:
		print("away")
	else:
		print("close")
