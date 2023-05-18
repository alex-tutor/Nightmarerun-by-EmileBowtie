extends Node2D


func _ready():
	pass

# warning-ignore:unused_argument
func _process(delta):
	if Global.game_started:
		$AnimatedSprite/AnimationPlayer.play("Scroll")
	if Global.game_over:
		$AnimatedSprite/AnimationPlayer.stop()

