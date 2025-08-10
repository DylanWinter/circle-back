extends CharacterBody2D

var can_move : bool = true
var SPEED = 300.0
var energized = false
var slide = false

var slideSpeed = 500

var lastInputDir : Vector2

var knockbackSlide = false
var knockbackDir : Vector2

func _ready() -> void:
	GameManager.player = self
	


func _physics_process(delta: float) -> void:
	self.z_index = $CollisionShape2D.global_position.y
	var input_direction := Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	)
	
	
	if can_move:
		if input_direction != Vector2.ZERO:
			lastInputDir = input_direction
			if not $AnimatedSprite2D.is_playing():
				$AnimatedSprite2D.play("walk")
			input_direction = input_direction.normalized()
			if energized == false:
				velocity = input_direction * SPEED
			else:
				velocity = input_direction * (SPEED + 100)
			
			
			if input_direction.x>0 and $AnimatedSprite2D.scale.x>0:
				$AnimatedSprite2D.scale.x *= -1
			elif input_direction.x<0 and $AnimatedSprite2D.scale.x<0:
				$AnimatedSprite2D.scale.x *= -1
		else:
			$AnimatedSprite2D.stop()
			velocity = velocity.move_toward(Vector2.ZERO, SPEED)

		
		move_and_slide()
		
		if Input.is_action_just_pressed("interact"):
			if GameManager.closest_interactable_npc:
				if GameManager.closest_interactable_npc.isStopped == true and GameManager.closest_interactable_npc.alreadyStartedDialogue == false:
					GameManager.closest_interactable_npc.start_dialogue()
	else:
		$AnimatedSprite2D.stop()
	
	
	if slide == true:
		if $slideTimer.is_stopped():
			$slideTimer.start()
			slideSpeed = 500
		can_move = false
		if slideSpeed>0:
			slideSpeed -= 10
		var slideDirection = lastInputDir.normalized()
		velocity = lastInputDir * slideSpeed
		move_and_slide()
		
	if knockbackSlide == true:
		if $knockbackSlideTimer.is_stopped():
			$knockbackSlideTimer.start()
			slideSpeed = 500
		
		#can_move = false
		
		if slideSpeed>0:
			slideSpeed -= 10
		var slideDirection = knockbackDir.normalized()
		velocity = knockbackDir * slideSpeed
		move_and_slide()
		

func _on_slide_timer_timeout() -> void:
	slide = false
	$slideTimer.stop()
	can_move = true


func _on_knockback_slide_timer_timeout() -> void:
	knockbackSlide = false
	$knockbackSlideTimer.stop()
	can_move = true
