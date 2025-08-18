extends Sprite2D


#var minigameScene = preload("res://minigame/minigame.tscn").instantiate()

var playerNear = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	z_index = $groundPos.global_position.y
	
	if playerNear == true and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://minigame/minigame.tscn")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		playerNear = true
		
	
	
	pass


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		playerNear = false
