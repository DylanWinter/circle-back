extends Node2D


var mouseOnBubble = false
@export var dialogueScenePath : String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mouseOnBubble == true and Input.is_action_just_pressed("left_click"):
		print("hello")
		#var dialogueScene = load(dialogueScenePath)
		#get_parent().add_child(dialogueScene)
		#dialogueScene.startDialogue()
		

'''
func _on_area_2d_mouse_entered() -> void:
	print("mouseIn")
	mouseOnBubble = true
	$AnimatedSprite2D.self_modulate = Color(1,1,1)
	


func _on_area_2d_mouse_exited() -> void:
	mouseOnBubble = false
	$AnimatedSprite2D.self_modulate = Color(0.65,0.65,0.65)
	
'''
