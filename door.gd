extends Node

func _process(delta: float) -> void:
	if GameManager.door_open:
		self.get_parent().queue_free()
