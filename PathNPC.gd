extends Node2D

@export var stopTimer : Timer

var stop = false

@export var positions = []

@export var facingRight : bool

var lastPosition : Vector2

var speed = 300.0

func _process(delta: float) -> void:
	if stop == true:
		stop = false
		stopTimer.start()
		
	z_index = $groundPos.position.y
	$Path2D/PathFollow2D.progress += speed*delta
	
	lastPosition = $AnimatedSprite2D.position
	$AnimatedSprite2D.position = $Path2D/PathFollow2D.position
	
	var goingRight = false
	if $AnimatedSprite2D.position.x - lastPosition.x>0:
		goingRight = true
	
	
	if goingRight and $AnimatedSprite2D.scale.x > 0:
		$AnimatedSprite2D.scale.x *= -1.0
		
	elif not goingRight and $AnimatedSprite2D.scale.x < 0:
		$AnimatedSprite2D.scale.x *= -1.0
		
		


func _on_timer_timeout() -> void:
	stop = true
