extends Area2D

var playerNear = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var shader_material : ShaderMaterial = get_parent().material
	shader_material.set_shader_parameter("blink_time_scale",0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playerNear == true and get_parent().material.get_shader_parameter("blink_time_scale")==0 and GameManager.player.energized==false:
		get_parent().material.set_shader_parameter("blink_time_scale",2.8)
		
	if playerNear == true and Input.is_action_pressed("interact") and GameManager.player.energized == false:
		GameManager.player.energized=true
		$AudioStreamPlayer.play()
		var shader_material : ShaderMaterial = get_parent().material
		shader_material.set_shader_parameter("blink_time_scale",0)
		
	if playerNear == false and get_parent().material.get_shader_parameter("blink_time_scale")==2.8 and GameManager.player.energized==false:
		var shader_material : ShaderMaterial = get_parent().material
		shader_material.set_shader_parameter("blink_time_scale",0)



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		playerNear = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		playerNear = false
