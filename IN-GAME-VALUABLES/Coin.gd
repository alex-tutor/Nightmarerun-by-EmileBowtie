extends Node2D


func _process(delta):
	position.x += -Global.obstacle_speed * delta
	if global_position.x <= -400:
		queue_free()
	if Global.game_over:
		queue_free()

func _on_Coin_body_entered(body):
	if body is Player:
		$Coin/Sprite/AnimationPlayer.play("Collected")
		Global.coin_score += 1
		Global.coin_collected = true
		queue_free()
		
