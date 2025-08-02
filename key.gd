extends Node

func _process(delta: float) -> void:
	if GameManager.found_key:
		self.get_parent().queue_free()
