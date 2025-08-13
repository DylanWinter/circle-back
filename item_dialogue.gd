extends Node2D



@export var dialogue : DialogueResource
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.connect("dialogue_ended", Callable(self, "_on_dialogue_ended"))

func start_dialogue() -> void:
	GameManager.player.can_move = false
	GameManager.is_in_conversation = true
	DialogueManager.show_dialogue_balloon(dialogue)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.closest_interactable_npc == self and Input.is_action_just_pressed("interact"):
		start_dialogue()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if GameManager.closest_interactable_npc == null and body.is_in_group("Player"):
		GameManager.closest_interactable_npc = self


func _on_area_2d_body_exited(body: Node2D) -> void:
	if GameManager.closest_interactable_npc == self:
		GameManager.closest_interactable_npc = null
		
		

func _on_dialogue_ended(resource) -> void:
	GameManager.player.can_move = true
	GameManager.is_in_conversation = false
