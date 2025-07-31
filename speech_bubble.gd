extends Control
var target: Node2D

@onready var label = $NinePatchRect/RichTextLabel
var offset : Vector2 = Vector2(0, -40)

func show_message(target_node: Node2D, text: String, duration: float = 2.0):
	target = target_node
	label.text = text
	show()
	await get_tree().create_timer(duration).timeout
	hide()

func _process(delta: float) -> void:
	label.add_theme_color_override("default_color", Color.BLACK)
	
	if target and is_instance_valid(target):
		var cam = get_viewport().get_camera_2d()
		if cam:
			var cam_transform = cam.get_canvas_transform()
			var inv = cam_transform.affine_inverse()
			var screen_pos = inv.basis_xform(target.global_position - inv.get_origin())
			position = screen_pos + offset
