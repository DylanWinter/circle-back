extends Node2D


# Called when the node enters the scene tree for the first time.




var gapInSpeechBubbleVision = 100
var isAway : bool = true

@onready var playerDistToConvo : float = self.global_position.distance_to(GameManager.player.global_position)
var distConsideredClose : float = 1000

var speechBubbleLarge = false


@export var convoCharacters : Array
@export var convoTopic : String

func _ready() -> void:
	if playerDistToConvo <= distConsideredClose:
		speechBubbleLarge = false
	elif playerDistToConvo > distConsideredClose:
		speechBubbleLarge = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var screen_size = get_window().size
	if GameManager.player.global_position.x + screen_size.x/2.0 < global_position.x - gapInSpeechBubbleVision:
		isAway = true
	elif GameManager.player.global_position.x - screen_size.x/2.0 > global_position.x + gapInSpeechBubbleVision:
		isAway = true
	elif GameManager.player.global_position.y + screen_size.y/2.0 < global_position.y - gapInSpeechBubbleVision:
		isAway = true
	elif GameManager.player.global_position.y - screen_size.y/2.0 > global_position.y + gapInSpeechBubbleVision:
		isAway = true
	else:
		isAway = false
		
	
	if isAway:
		$speechBubbleRotater/speechBubbleFarAwayAnim.visible = true
		$speechBubbleRotater.global_position = GameManager.player.global_position
		var angleToSpeechPoint = GameManager.player.global_position.angle_to_point(self.global_position)
		$speechBubbleRotater.global_rotation = angleToSpeechPoint
		
		playerDistToConvo = self.global_position.distance_to(GameManager.player.global_position)
	
		if playerDistToConvo <= distConsideredClose and speechBubbleLarge == false:
			speechBubbleLarge = true
			$AnimationPlayer.play("sizeBubbleUp")
		elif playerDistToConvo > distConsideredClose and speechBubbleLarge == true:
			speechBubbleLarge = false
			$AnimationPlayer.play("sizeBubbleDown")
			
		
	else:
		$speechBubbleRotater/speechBubbleFarAwayAnim.visible = false
		#var playerDirToEvent : Vector2 = global_position-GameManager.player.global_position
		#playerDirToEvent = playerDirToEvent.normalized()
		#print(GameManager.player.global_position.angle_to_point(global_position))
		
		
		#playerDirToEvent.angle_to_point()
