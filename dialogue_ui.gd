extends Control


var meetingQuestions = load("res://dialogue/MeetingQuestions.dialogue")
var trackedTurn : String = "boss"

func _ready() -> void:
	DialogueManager.connect("dialogue_ended", Callable(self, "_on_dialogue_ended"))
	$bossAnimPlayer.play("setBossTurnOn")
	start_dialogue(meetingQuestions)


func start_dialogue(dialogue) -> void:
	DialogueManager.show_dialogue_balloon(dialogue)


func _process(delta: float) -> void:
	if GameManager.currentTurn != trackedTurn:
		if GameManager.currentTurn != "randomEmployee":
			$randomEmpAnimPlayer.play("setRandomEmpTurnOff")
			
		if GameManager.currentTurn == "player":
			$bossAnimPlayer.play("setBossTurnOff")
			$playerAnimPlayer.play("setPlayerTurnOn")
			
		elif GameManager.currentTurn == "boss" and trackedTurn != "randomEmployee":
			$bossAnimPlayer.play("setBossTurnOn")
			
		elif GameManager.currentTurn == "randomEmployee":
			$randomEmpAnimPlayer.play("setRandomEmpTurnOn")
		
		
		trackedTurn = GameManager.currentTurn

func _on_dialogue_ended(resource) -> void:
	SceneTransition.change_scene("res://end_screen.tscn")
		
