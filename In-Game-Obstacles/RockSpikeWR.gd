extends StaticBody2D


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if !Global.game_over:
		position.x += -Global.obstacle_speed * delta
	if Global.game_over:
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	Global.rope_switch = true
	queue_free()
