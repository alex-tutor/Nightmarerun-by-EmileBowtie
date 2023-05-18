extends CanvasLayer

signal Game_Cont

func _ready():
	var emmiting_node = get_tree().get_root().find_node("KinematicBody2D",true,false)
	emmiting_node.connect("test_one",self,"test_one_handle")
	visible = false

func test_one_handle():
	visible = true

func _on_Button_pressed():
	Global.pause_spawning = false
	Global.stop_starting_CT = false
	Global.rope_switch = false
	Global.is_plus_100 = 0
	Global.obstacle_speed = Global.obstacle_speed_for_3
	Global.skull_score = 0
	Global.mile_score = 0
	Global.coin_score = 0
	Global.game_over = false
	Global.cutscene_ended = false
	Global.pre_game_cutscene_started = false
	Global.game_started = false
	Global.show_game_over = false
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
	visible = false

func _on_Continuebutton_pressed():
	Global.pause_spawning = false
	Global.stop_starting_CT = false
	Global.rope_switch = false
	emit_signal("Game_Cont")
	Global.game_over = false
	visible = false
	Global.Restart = true
	Global.show_game_over = false
	Global.game_started = true
