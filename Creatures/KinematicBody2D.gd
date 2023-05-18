extends KinematicBody2D
class_name Player

signal test_one

onready var animation_tree = $AnimationTree
onready var state_machine = animation_tree.get("parameters/playback")

onready var timer = $Timer
var bullet_delay = 0.4
var can_shoot = true

func _ready():
# warning-ignore:return_value_discarded
	Global.connect("cliff_turn",self,"cliff_turn_handle")
# warning-ignore:return_value_discarded
	GameOverTab.connect("Game_Cont",self,"Game_Cont_handle")
	timer.set_wait_time(bullet_delay)
	timer.connect("timeout",self,"_on_timeout_complete")
	state_machine.start("Running-Idle")
	$CrouchCollision.disabled = true
	$FullBodyCollision.disabled = false

func _on_timeout_complete():
	can_shoot = true

const gravity = 30
const UP = Vector2(0,-1)
var motion = Vector2()

var jump_count = 0
export var extrajumps = 1
const jump = -714
var is_jumping 
var is_crouching

# warning-ignore:unused_argument
func _physics_process(delta):
	if Global.cutscene_ended:
		$AnimatedSprite.visible = true
	if Global.game_started:
		animation_tree.set_active(true)
# warning-ignore:unused_variable
		var current = state_machine.get_current_node()
		motion.y += gravity
		if Input.is_action_just_pressed("game_jump") && jump_count < extrajumps:
			state_machine.travel("Death")
			motion.y = jump
			jump_count += 1
			is_jumping = true
		if Input.is_action_pressed("game_slide"):
			state_machine.travel("Crouch-Slide")
			is_crouching = true
			is_jumping = false
			$CrouchCollision.disabled = false
			$FullBodyCollision.disabled = true
		if Input.is_action_just_released("game_slide"):
			state_machine.start("Running-Idle")
			is_crouching = false
			is_jumping = false
			$CrouchCollision.disabled = true
			$FullBodyCollision.disabled = false
		if Input.is_action_just_pressed("game_attack")&&!is_jumping&&!is_crouching&&can_shoot:
			state_machine.travel("attack")
			Global.camera.shake(0.4,1)
			$Weapon/SpreadAnimation.play("ShotgunSpread")
		if is_on_floor():
			jump_count = 0
			is_jumping = false
		if !is_on_floor()&&jump_count>0:
			state_machine.travel("Jump")
		if Global.game_over:
			died()
		motion = move_and_slide(motion,UP)

func _on_Weapon_area_entered(area):
	if area.has_method("Enemy_Killed"):
		area.Enemy_Killed()

func died():
	state_machine.travel("Death")
	Global.game_over = true
	Global.camera.shake(1,1.3)
	state_machine.travel("Death")
	emit_signal("test_one")

func Game_Cont_handle():
	visible = true
	$AnimatedSprite.visible = true
	state_machine.travel("Jump")

func _on_SpreadAnimation_animation_finished(anim_name):
	if anim_name == "ShotgunSpread":
		can_shoot = false
		timer.start()

func cliff_turn_handle():
	Global.camera.shake(1,1.3)
	pass

