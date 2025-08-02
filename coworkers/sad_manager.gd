extends Node2D


var startedWalking = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	$npcSprite.z_index=$npcSprite/groundPos.global_position.y
	var lastPosition = $npcSprite.position
	if GameManager.talkedInKitchen == true and startedWalking == false:
		startedWalking = true
		
	if startedWalking == true and $Path2D/PathFollow2D.progress_ratio<1 and GameManager.is_in_conversation==false:
		$Path2D/PathFollow2D.progress += 100*delta
		$npcSprite.position = $Path2D/PathFollow2D.position
		if shouldFlipBasedOnMovement(lastPosition, $npcSprite.position,$npcSprite):
			$npcSprite.scale.x *= -1.0
		
func shouldFlipBasedOnMovement(lastPosition : Vector2, currentPosition : Vector2, sprite : Sprite2D) -> bool:
	var direction : Vector2
	direction = currentPosition - lastPosition
	var shouldFlip = true
	if currentPosition.x - lastPosition.x < 0 and sprite.scale.x>0:
		shouldFlip = false
	elif currentPosition.x - lastPosition.x > 0 and sprite.scale.x<0:
		shouldFlip = false
	
	return shouldFlip
