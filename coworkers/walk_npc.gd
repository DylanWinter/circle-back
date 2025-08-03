extends Node2D

@export var walkSpeed = 60
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Path2D/PathFollow2D.progress += walkSpeed*delta
	$AnimatedSprite2D.global_position = $Path2D/PathFollow2D.global_position
	z_index = $groundPos.global_position.y
