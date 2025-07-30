extends Node2D

@export var coworker_title : String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_dialogue("a")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# dialogue here likely not just string but some dialogue component from
# dialogue_manager addon with the dialogue included
func start_dialogue(dialogue: String) -> void: 
	$dialogue_timer.start()
	print(coworker_title+" Dialogue Started")


func _on_dialogue_timer_timeout() -> void:
	print(coworker_title+" DialogueFinished")
