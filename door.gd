extends Node

func _process(delta: float) -> void:
	if GameManager.door_open:
		self.get_parent().queue_free()
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	#get_parent().get_node("npcSprite2").material.set_shader_parameter("isInteractable", true)
	#$npcSprite2.visible = true
	#$npcSprite.visible = false
	self.material.set_shader_parameter("blink_time_scale", 3.2)
	
	pass


func _on_area_2d_body_exited(body: Node2D) -> void:
	#get_parent().get_node("npcSprite2").material.set_shader_parameter("isInteractable", false)
	#self.texture = load("res://assets/Key.png")
	#$npcSprite2.visible = false
	#$npcSprite.visible = true
	self.material.set_shader_parameter("blink_time_scale", 0.0)
	pass
