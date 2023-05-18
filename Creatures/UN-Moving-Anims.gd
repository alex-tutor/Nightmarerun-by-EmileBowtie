extends AnimatedSprite


func _ready():
	pass 

# warning-ignore:unused_argument
func _process(delta):
	if Global.pre_game_cutscene_started:
		$AnimationPlayer.play("Turning")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Turning":
		Global.game_started = true
		queue_free()
		Global.cutscene_ended = true
	if anim_name == "Clyde-Death":
		queue_free()


