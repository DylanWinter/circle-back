extends Node2D

var test = load("res://dialogue/test.dialogue")
@export var coworker_title : String
@export var walk_path : Line2D
@export var dialogueScenePaths : Array
var currentScenePathIndex = 0


var walkSpeed : int = 30
var lastPosition : Vector2

var isStopped : bool = false
var alreadyStartedDialogue : bool = false

# string time array
@export var conversationTimes : Array

@onready var speechBubbleSprite : AnimatedSprite2D = $npcSprite/AnimatedSprite2D

func shouldFlipBasedOnMovement(lastPosition : Vector2, currentPosition : Vector2, sprite : Sprite2D) -> bool:
	var direction : Vector2
	direction = currentPosition - lastPosition
	var shouldFlip = true
	if currentPosition.x - lastPosition.x < 0 and sprite.scale.x>0:
		shouldFlip = false
	elif currentPosition.x - lastPosition.x > 0 and sprite.scale.x<0:
		shouldFlip = false
	return shouldFlip
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#DialogueManager.connect("dialogue_ended", Callable(self, "_on_dialogue_ended"))
	speechBubbleSprite.frame = 1
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not GameManager.is_in_conversation:
		lastPosition = $npcSprite.position
		if has_node("Path2D/PathFollow2D") and isStopped == false:
			alreadyStartedDialogue = false
			$Path2D/PathFollow2D.progress += walkSpeed*delta
			$npcSprite.position = $Path2D/PathFollow2D.position
			if shouldFlipBasedOnMovement(lastPosition, $npcSprite.position,$npcSprite):
				$npcSprite.scale.x *= -1.0
		z_index = $npcSprite/groundPos.global_position.y
		
		if dialogueScenePaths.size()>0 and isStopped == true and alreadyStartedDialogue == false:
			speechBubbleSprite.visible = true
		else:
			speechBubbleSprite.visible = false
		

	# format: time of arrival | how long they stay
	for conversateTime in conversationTimes:
		var parts = conversateTime.split("|")
		var time_parts1 = parts[0].split(":")
		var time_parts2 = parts[1].split(":")
		var arrivalMinute = int(time_parts1[0])
		var arrivalSecond = int(time_parts1[1])
		
		var howLongMinute = int(time_parts2[0])
		var howLongSecond = int(time_parts2[1])
		
		
		
		if (arrivalMinute==GameManager.timerMinutes and arrivalSecond==GameManager.timerSeconds):
			isStopped = true
			$waitTimer.wait_time = howLongSecond + howLongMinute * 60
			$waitTimer.start()
			
		
func start_dialogue() -> void:
	#GameManager.player.can_move = false
	#GameManager.is_in_conversation = true
	#DialogueManager.show_dialogue_balloon(test)
	if dialogueScenePaths.size()>currentScenePathIndex:
		var dialogueScene = load(dialogueScenePaths[currentScenePathIndex]).instantiate()
		get_parent().add_child(dialogueScene)
		currentScenePathIndex += 1
		dialogueScene.start_dialogue()
	elif dialogueScenePaths.size() > 0:
		var dialogueScene = load(dialogueScenePaths[-1]).instantiate()
		get_parent().add_child(dialogueScene)
		dialogueScene.start_dialogue()
	alreadyStartedDialogue = true
	speechBubbleSprite.visible = false
	

'''
func _on_dialogue_ended(resource) -> void:
	#GameManager.player.can_move = true
	#GameManager.is_in_conversation = false
'''

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.is_in_group("Player")):
		GameManager.closest_interactable_npc = self
		if speechBubbleSprite.visible == true:
			speechBubbleSprite.frame=0


func _on_area_2d_body_exited(body: Node2D) -> void:
	if (body.is_in_group("Player") and GameManager.closest_interactable_npc == self):
		GameManager.closest_interactable_npc = null
		if speechBubbleSprite.visible == true:
			speechBubbleSprite.frame=1


func _on_wait_timer_timeout() -> void:
	isStopped = false
