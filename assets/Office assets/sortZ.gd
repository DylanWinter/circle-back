extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for node in get_children():
		if node.has_node("groundPos"):
			node.z_index = node.get_node("groundPos").global_position.y
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
