extends Area2D

func _ready():
	pass

func _process(delta):
	if !Global.game_over:
		position.x += -Global.obstacle_speed * delta
	if Global.game_over:
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_TallObstacle_body_entered(body):
	if body.has_method("died"):
		body.died()
