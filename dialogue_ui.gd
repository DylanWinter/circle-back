extends Control


var meetingQuestions = load("res://dialogue/newMeetingQuestions.dialogue")
var trackedTurn : String = "boss"

func _ready() -> void:
	DialogueManager.connect("dialogue_ended", Callable(self, "_on_dialogue_ended"))
	Music.switch("boss")
	start_dialogue(meetingQuestions)


func start_dialogue(dialogue) -> void:
	DialogueManager.show_dialogue_balloon(dialogue)


func _process(delta: float) -> void:
	pass
func _on_dialogue_ended(resource) -> void:
	SceneTransition.change_scene("res://end_screen.tscn")
		
