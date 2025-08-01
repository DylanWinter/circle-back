extends Node2D


@export var dialogue : DialogueResource
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.connect("dialogue_ended", Callable(self, "_on_dialogue_ended"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	
func start_dialogue() -> void:
	GameManager.player.can_move = false
	GameManager.is_in_conversation = true
	DialogueManager.show_dialogue_balloon(dialogue)

func _on_dialogue_ended(resource) -> void:
	GameManager.player.can_move = true
	GameManager.is_in_conversation = false
	self.queue_free()
