extends StaticBody2D

var playerNear = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playerNear == true and Input.is_action_pressed("interact"):
		$Sprite2D.visible = false
		$CollisionShape2D.disabled = true
		GameManager.found_key=true
	elif playerNear == true and Input.is_action_pressed("interact"):
		$Sprite2D.visible = true
		$CollisionShape2D.disabled = false
		
	print("playerNear")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		playerNear = true
		$Sprite2D.material.set_shader_parameter("blink_time_scale", 3.2)

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		playerNear = false
		$Sprite2D.material.set_shader_parameter("blink_time_scale", 0.0)
