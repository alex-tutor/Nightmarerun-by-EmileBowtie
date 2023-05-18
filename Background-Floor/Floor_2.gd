extends StaticBody2D

onready var animation_tree = $Floor_2/AnimationTree
onready var state_machine = animation_tree.get("parameters/playback")

func _ready():
	Global.connect("switch_segment",self,"switch_segment_handle")
	Global.connect("cliff_turn",self,"on_cliff_turn")
	state_machine.travel("Three-SecL-scroll")
	pass 

# warning-ignore:unused_argument
func _process(delta):
	if Global.game_started:
		$Floor_2/AnimationTree.set_active(true)
	if Global.game_over:
		$Floor_2/AnimationTree.set_active(false)
	if Global.mile_score >= 140:
		state_machine.travel("Between-SecL-scroll")
	if Global.mile_score >= 315:
		state_machine.travel("Two-SecL-scroll")

func on_cliff_turn():
	state_machine.travel("ScrollFullTTC")
	$Floor_2/Sprite.texture = preload("res://FloorWithCliff.png")

func switch_segment_handle(): 
	$Floor_2/AnimationTree.set_active(true)
	$Floor_2/Sprite.texture = preload("res://FLOO_2.png")
	state_machine.travel("ComeUp")
	return(0)

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "ComeUp"&&Global.game_started:
		$Floor_2/AnimationPlayer.reset_on_save = true
		state_machine.travel("Three-SecL-scroll")
