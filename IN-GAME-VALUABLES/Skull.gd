extends KinematicBody2D

const gravity = 30
const UP = Vector2(0,-1)
var motion = Vector2()

func _ready():
	visible = false

func _process(delta):
	position.x += -Global.enemy_speed * delta
	motion = move_and_slide(motion,UP)
	if Global.Spawn_Skull:
		motion.y += gravity
		visible = true
	if Global.game_over:
		Global.Spawn_Skull = false
		visible = false
		queue_free()

func _on_VisibilityNotifier2D_screen_entered():
	Global.Spawn_Skull = false
	visible = false

func _on_VisibilityNotifier2D_screen_exited():
	visible = false
	Global.Spawn_Skull = false
	queue_free()

func _on_Area2D_body_entered(body):
	if body is Player:
		Global.Spawn_Skull = false
		visible = false
		Global.skull_score += 1
		Global.skull_collected = true
		queue_free()
