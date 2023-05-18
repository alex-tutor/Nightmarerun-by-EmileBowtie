extends CanvasLayer

func _ready():
	pass

# warning-ignore:unused_argument
func _process(delta):
	if Global.game_started:
		visible = true
	$Label.text = str(Global.coin_score)
	$Label2.text = str(Global.skull_score)
	if Global.coin_collected:
		$Sprite/AnimationPlayer.play("CoinCollected")
	if Global.skull_collected:
		$Sprite/AnimationPlayer.play("SkullCollected")
		


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "CoinCollected":
		$Sprite/AnimationPlayer.stop(true)
		Global.coin_collected = false
	if anim_name == "SkullCollected":
		$Sprite/AnimationPlayer.stop(true)
		Global.skull_collected = false


func _on_Timer_timeout():
	if Global.game_started:
		Global.mile_score += 1
		if !Global.stop_starting_CT:
			Global.is_plus_100 += 1
		if Global.rope_segment:
			Global.rope_segment_count += 1
		$MileLabel.text = str(Global.mile_score)
	if Global.game_over:
		Global.game_started = false
