extends StaticBody2D
class_name Rope
var stop_moving = false

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Global.rope_switch:
		play_scroll()
	if !Global.game_over && !stop_moving:
		position.x += -Global.obstacle_speed * delta
	if Global.game_over:
		queue_free()

func play_scroll():
	Global.rope_segment = true
	stop_moving = true
	$AnimationPlayer.play("RopeScroll")
	pass
