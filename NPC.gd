extends Node2D

var test = load("res://dialogue/test.dialogue")
@export var coworker_title : String
@export var walk_path : Line2D

var walkSpeed : int = 30
var lastPosition : Vector2


# string time array
@export var conversationTimes : Array

func shouldFlipBasedOnMovement(lastPosition : Vector2, currentPosition : Vector2, sprite : Sprite2D) -> bool:
	var direction : Vector2
	direction = currentPosition - lastPosition
	
	var shouldFlip = false
	if currentPosition.x - lastPosition.x < 0 and sprite.scale.x>0:
		shouldFlip = true
	elif currentPosition.x - lastPosition.x > 0 and sprite.scale.x<0:
		shouldFlip = true
	return shouldFlip
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.connect("dialogue_ended", Callable(self, "_on_dialogue_ended"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not GameManager.is_in_conversation:
		lastPosition = $StaticBody2D.position
		#$Path2D/PathFollow2D.progress += walkSpeed*delta
		#$StaticBody2D.position = $Path2D/PathFollow2D.position
		z_index = $StaticBody2D.global_position.y
		#if shouldFlipBasedOnMovement(lastPosition, $StaticBody2D.position,$StaticBody2D/npcSprite):
		#	$StaticBody2D/npcSprite.scale.x *= -1.0
	
	# format: time|x|y
	for conversateTime in conversationTimes:
		var parts = conversateTime.split("|")
		var time_parts = parts[0].split(":")
		var converseMinute = int(time_parts[0])
		var converseSecond = int(time_parts[1])
		var x = float(parts[1])
		var y = float(parts[2])
		
		if converseMinute == GameManager.timerMinutes and converseSecond == GameManager.timerSeconds:
			position = Vector2(x,y)
			
		
func start_dialogue() -> void:
	GameManager.player.can_move = false
	GameManager.is_in_conversation = true
	DialogueManager.show_dialogue_balloon(test)

func _on_dialogue_ended(resource) -> void:
	GameManager.player.can_move = true
	GameManager.is_in_conversation = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.is_in_group("Player")):
		GameManager.closest_interactable_npc = self


func _on_area_2d_body_exited(body: Node2D) -> void:
	if (body.is_in_group("Player") and GameManager.closest_interactable_npc == self):
		GameManager.closest_interactable_npc = null
