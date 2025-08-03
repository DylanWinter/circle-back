extends Area2D

var close = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if close == true and Input.is_action_just_pressed("interact"):
		GameManager.player.energized = true
		get_parent().get_node("VendingMachine").material.set_shader_parameter("blink_time_scale",0.0)
		pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and GameManager.player.energized == false:
		get_parent().get_node("VendingMachine").material.set_shader_parameter("blink_time_scale",1.9)
		close = true
		


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player") and GameManager.player.energized == false:
		get_parent().get_node("VendingMachine").material.set_shader_parameter("blink_time_scale",0.0)
		close = false
