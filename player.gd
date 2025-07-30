extends CharacterBody2D

var can_move : bool = true
const SPEED = 300.0

func _ready() -> void:
	GameManager.player = self

	
func _physics_process(delta: float) -> void:
	var input_direction := Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	)
	
	if can_move:
		if input_direction != Vector2.ZERO:
			input_direction = input_direction.normalized()
			velocity = input_direction * SPEED
		else:
			velocity = velocity.move_toward(Vector2.ZERO, SPEED)
	
		move_and_slide()
		
		if Input.is_action_just_pressed("interact"):
			GameManager.closest_interactable_npc.start_dialogue()
