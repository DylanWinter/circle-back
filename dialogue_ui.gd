extends Control


var dialogue : String = "Hello this is some dialogue! "
var charIndex : int = 0
@onready var dialogueLabel : Label = $dialogueLabel
var currentTurn : String = "right"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$dialogueTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_dialogue_timer_timeout() -> void:
	print(charIndex)
	if charIndex < len(dialogue):
		dialogueLabel.text = dialogueLabel.text + dialogue[charIndex]
		charIndex += 1
		$dialogueTimer.start()
	else:
		charIndex = 0
		$dialogueTimer.stop()


func _on_next_button_pressed() -> void:
	pass # Replace with function body.
