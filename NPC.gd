extends Node2D

var test = load("res://dialogue/test.dialogue")
@export var coworker_title : String
@export var walk_path : Line2D

var walkSpeed : int = 30
var lastPosition : Vector2

func shouldFlipBasedOnMovement(lastPosition : Vector2, currentPosition : Vector2) -> bool:
	if currentPosition.x - lastPosition.x < 0:
		return true
	else:
		return false
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.connect("dialogue_ended", Callable(self, "_on_dialogue_ended"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	lastPosition = $StaticBody2D.position
	print(lastPosition)
	$Path2D/PathFollow2D.progress += walkSpeed*delta
	$StaticBody2D.position = $Path2D/PathFollow2D.position
	print($StaticBody2D.position)
	
		
	z_index = $StaticBody2D.global_position.y
	
		

func start_dialogue() -> void:
	GameManager.player.can_move = false
	DialogueManager.show_dialogue_balloon(test)

func _on_dialogue_ended(resource) -> void:
	GameManager.player.can_move = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.is_in_group("Player")):
		GameManager.closest_interactable_npc = self


func _on_area_2d_body_exited(body: Node2D) -> void:
	if (body.is_in_group("Player") and GameManager.closest_interactable_npc == self):
		GameManager.closest_interactable_npc = null


func _on_flip_timer_timeout() -> void:
	if shouldFlipBasedOnMovement(lastPosition, $StaticBody2D.position):
		print("flip")
		$StaticBody2D/npcSprite.scale.x *= -1.0
