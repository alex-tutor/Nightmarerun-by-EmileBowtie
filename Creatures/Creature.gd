extends Node2D


func _ready():
# warning-ignore:return_value_discarded
	Global.connect("cliff_turn",self,"on_cliff_turn_rh")
	pass 

var wall_exists = true
var can_play_scream = true
var can_run = true

# warning-ignore:unused_argument
func _process(delta):
	if wall_exists:
		if Global.pre_game_cutscene_started:
			$Wall/WallAnimationPlayer.play("WallBreak")
	if Global.game_started&&can_run:
		$Creature/CreatureAnimationPlayer.play("Creature-Idle-Running")
	if Global.game_over:
		$Creature/CreatureAnimationPlayer.stop()
	if !can_run:
		$Creature/CreatureAnimationPlayer.play("GoAway")


func _on_CreatureAnimationPlayer_animation_finished(anim_name):
	if anim_name == "PreGameScream":
		can_play_scream = false
		Global.game_started = true
	if anim_name == "GoAway":
		$Creature.visible = false


func _on_WallAnimationPlayer_animation_finished(anim_name):
	if anim_name == "WallBreak":
		wall_exists = false
		$Wall.queue_free()
		if can_play_scream:
			$Creature/CreatureAnimationPlayer.play("PreGameScream")

func on_cliff_turn_rh():
	can_run = false
