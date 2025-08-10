extends StaticBody2D

var playerNear = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playerNear == true and Input.is_action_pressed("interact"):
		$Sprite2D.visible = false
		$CollisionShape2D.disabled = true
		GameManager.found_key=true
	elif playerNear == true and Input.is_action_pressed("interact"):
		$Sprite2D.visible = true
		$CollisionShape2D.disabled = false
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		playerNear = true
		$Sprite2D.material.set_shader_parameter("blink_time_scale", 3.2)

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		playerNear = false
		$Sprite2D.material.set_shader_parameter("blink_time_scale", 0.0)





















'''
TITLE: Narrative rank #4
FEATURING THE CHARACTERS: oxygen, john loopy
WRITERS: jakie, burg, jakie, burg, jakie
RATED 18+
John Loopy was laid out on the hospital stretcher, in and out of surgery during the GMTK game jam 2025
People took his breath away, played with his heart… but always failed to bring him sweet release. He kept coming back. And so did that other guy, Oxygen.
The tall beefy man that’s seemed to be everywhere and gave life to everything, was now standing over his hostpial bed, his touch like a cool breeze and his gaze tender, his formal
--------------------
competition was never anything like who he saw in the stretcher. For generations John Loopy and Oxygen had been at war with each other, an impenetrable force meeting an immovable object. They never hated each other, but saw each other as some form of competition, they were both eternal and so the only sourse of action was for them to fight once and for all. Oxygen invites John loopy to a duel
--------------------
John know what they would mean.
“I don’t need CPR right now…” John Loopy cocked his eyebrow at Oxygen. But Oxygen, ever the unmoving force, didn’t wait for someone to tell him when to go inside them. 
Oxygen’s tongue slide into John’s throat, viciously filling his mouth with hot air, gripping his pink shoulders against the hospital bed. Oxygen was silent but not deadly, smirking as John Loopy’s eyes rolled back, feeling his body recover rapidly but go weak from the touch of life.
--------------------
John Loopy didn't want this. He didn't want to be a normal human, he wanted to be destroyed as that is how he felt most comfortable and it meant he would continue to be immortal. Oxygen realized John was resisting and he understood that in order to bring John Loopy back into the mortal realm he had to have some extra fire power. Quickly Oxygen got on top of John and put on a strap on that allowed him to in some way insert more Oxygen into John more quickly. John was unable to resist and now Oxygen had started pegging John in hopes that he could get even deeper inside of John.
--------------------
This was the game they always played. Loopy would die by some game developer’s gamer hands and Oxygen would fix him up again. It both gave them a sick sense of pleasure but so be it. John resigned himself to the fucking, his body regenerating as his mind went blank, black pupils half lidded as drool dropped from his smiling mouth. “Ngh… Oxygen- I can’t b-breath- Fuck!”  Oxygen, the nudist periodic element only smirked, ramming more and more air into him and in a moment, taking his breath away. They were cursed into this forceful romance. Or was it a blessing in disguise? The immortal beginning and a noble gas, a match made in hell. GMTK Game Jam super hell.
'''
