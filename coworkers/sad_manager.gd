extends Node2D


var startedWalking = false
var startPossibleConvo = false

@export var walkSpeed = 500
var isStopped = false
var playerNear = false

var dialogue = "res://visualNovelOfficeScenes/sadManager/sadManagerConvo1.tscn"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	$npcSprite.z_index=$npcSprite/groundPos.global_position.y
	var lastPosition = $npcSprite.position
	if GameManager.talkedInKitchen == true and startedWalking == false:
		startedWalking = true
		
	if playerNear==true and Input.is_action_just_pressed("interact") and startPossibleConvo==true:
		var dialogueScene = load(dialogue).instantiate()
		get_parent().add_child(dialogueScene)
		GameManager.is_in_conversation=true
		
		dialogueScene.start_dialogue()
		
	if startedWalking == true and $Path2D/PathFollow2D.progress_ratio<1 and GameManager.is_in_conversation==false:
		$Path2D/PathFollow2D.progress += walkSpeed*delta
		$npcSprite.position = $Path2D/PathFollow2D.position
		$npcSprite/AnimatedSprite2D.visible = false
		if shouldFlipBasedOnMovement(lastPosition, $npcSprite.position,$npcSprite):
			$npcSprite.scale.x *= -1.0
			
	if $Path2D/PathFollow2D.progress_ratio == 1 and startPossibleConvo==false:
		startPossibleConvo = true
		$npcSprite.stop()
		$npcSprite/AnimatedSprite2D.visible = true
		$npcSprite/AnimatedSprite2D.frame = 1
			
func shouldFlipBasedOnMovement(lastPosition : Vector2, currentPosition : Vector2, sprite) -> bool:
	var direction : Vector2
	direction = currentPosition - lastPosition
	var shouldFlip = true
	if currentPosition.x - lastPosition.x < 0 and sprite.scale.x>0:
		shouldFlip = false
	elif currentPosition.x - lastPosition.x > 0 and sprite.scale.x<0:
		shouldFlip = false
	
	return shouldFlip


func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.is_in_group("Player")):
		playerNear = true
		'''
		if playerNear == false:
			var dialogueScene = load(dialogue).instantiate()
			get_parent().add_child(dialogueScene)
			GameManager.is_in_conversation=true
		
			dialogueScene.start_dialogue()
		playerNear = true
		GameManager.closest_interactable_npc = self
		if $npcSprite/AnimatedSprite2D.visible == true:
			$npcSprite/AnimatedSprite2D.frame=0
			
		'''


func _on_area_2d_body_exited(body: Node2D) -> void:
	if (body.is_in_group("Player")):
		playerNear = false
		'''
		GameManager.closest_interactable_npc = null
		if $npcSprite/AnimatedSprite2D.visible == true:
			$npcSprite/AnimatedSprite2D.frame=1
		'''
