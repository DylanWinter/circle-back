extends Node2D

var test = load("res://dialogue/test.dialogue")
@export var coworker_title : String
@export var walk_path : Line2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.connect("dialogue_ended", Callable(self, "_on_dialogue_ended"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.z_index = position.y
	
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
