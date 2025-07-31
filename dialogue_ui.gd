extends Control


var dialogueDict = {
	"bossFirstQ" : load("res://dialogue/BossQuestions1.dialogue"),
	"playerFirstR" : load("res://dialogue/PlayerResponse1.dialogue"),
	"randomEmpFirst" : load("res://dialogue/PlayerResponse1.dialogue")
	
}
var trackedTurn : String = "boss"
func _ready() -> void:
	DialogueManager.connect("dialogue_ended", Callable(self, "_on_dialogue_ended"))
	$AnimationPlayer.play("setBossTurn")
	start_dialogue(dialogueDict.get("bossFirstQ"))
	
func start_dialogue(dialogue) -> void:
	DialogueManager.show_dialogue_balloon(dialogue)

func _process(delta: float) -> void:
	if GameManager.currentTurn != trackedTurn:
		trackedTurn = GameManager.currentTurn
		if trackedTurn == "player":
			$AnimationPlayer.play("setPlayerTurn")
		elif trackedTurn == "boss":
			$AnimationPlayer.play("setBossTurn")
		elif trackedTurn == "randomEmployee":
			$AnimationPlayer.play("setRandomEmpTurn")
		
	
func _on_dialogue_ended(resource) -> void:
	
	
	if GameManager.endedConversation == false:
		pass
		
	else:
		#end game
		print("endedmeeting")
		
