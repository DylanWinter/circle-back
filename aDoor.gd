extends StaticBody2D

var playerNear = false

@export var dialogue : DialogueResource
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.connect("dialogue_ended", Callable(self, "_on_dialogue_ended"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playerNear == true and Input.is_action_pressed("interact") and GameManager.found_key == true:
		$Sprite2D.visible = false
		$CollisionShape2D.disabled = true
		
	elif playerNear == true and Input.is_action_pressed("interact") and $Timer.is_stopped() == false and GameManager.found_key == false and GameManager.is_in_conversation == false:
		start_dialogue()
		
		
		
func start_dialogue() -> void:
	GameManager.player.can_move = false
	GameManager.is_in_conversation = true
	print("locked")
	DialogueManager.show_dialogue_balloon(dialogue)
	

func _on_dialogue_ended(resource) -> void:
	GameManager.player.can_move = true
	GameManager.is_in_conversation = false
	$Timer.start()
	
	
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		playerNear = true
		$Sprite2D.material.set_shader_parameter("blink_time_scale", 3.2)
		
	elif body.is_in_group("spider"):
		$Sprite2D.visible = false
		
		
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		playerNear = false
		$Sprite2D.material.set_shader_parameter("blink_time_scale", 0.0)
		
	elif body.is_in_group("spider"):
		$Sprite2D.visible = true


func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("spider"):
		$Sprite2D.visible = false


func _on_area_2d_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("spider"):
		$Sprite2D.visible = true
