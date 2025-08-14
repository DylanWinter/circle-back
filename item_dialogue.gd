extends Node2D



@export var dialogue : DialogueResource
var playerNear = false
var canDialogue = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.connect("dialogue_ended", Callable(self, "_on_dialogue_ended"))

func start_dialogue() -> void:
	#GameManager.player.can_move = false
	GameManager.is_in_conversation = true
	DialogueManager.show_dialogue_balloon(dialogue)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playerNear == true and Input.is_action_just_pressed("interact") and canDialogue == true:
		canDialogue = false
		start_dialogue()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		canDialogue = true
		playerNear = true
		print("playernearchair")


func _on_area_2d_body_exited(body: Node2D) -> void:
	playerNear = false
	canDialogue = false
	print("playernotnearchair")
	#if GameManager.closest_interactable_npc == self:
	#	GameManager.closest_interactable_npc = null
		
		

func _on_dialogue_ended(resource) -> void:
	GameManager.is_in_conversation = false
