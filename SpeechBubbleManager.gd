extends CanvasLayer

@onready var bubble_scene = preload("res://speech_bubble.tscn")

func show_bubble(target: Node2D, text: String, duration: float = 6.0):
	var bubble : Node = bubble_scene.instantiate()
	add_child(bubble)
	bubble.show_message(target, text, duration)