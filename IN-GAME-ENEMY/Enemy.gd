extends Area2D

var stop_walking

func _process(delta):
	position.x += -Global.enemy_speed * delta
	if Global.game_over:
		queue_free()

func _ready():
	$CollisionShape2D.disabled = false
	pass

func Enemy_Killed():
	$AnimationPlayer.play("Killed")
	Global.Spawn_Skull = true

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Killed":
		queue_free()

func _on_Enemy_body_entered(body):
	if body.has_method("died"):
		body.died()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
