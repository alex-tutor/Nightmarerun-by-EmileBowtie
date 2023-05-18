extends Node

var game_started = false
var camera = null
var Clyde_Died
var game_over = false
var Spawn_Skull
var show_game_over
var Restart = false
var coin_score = 0
var coin_collected
var skull_score = 0
var skull_collected
var mile_score = 0
var is_plus_100 = 0
var pause_spawning
var stop_starting_CT = false
var rope_switch = false
var rope_segment
var rope_segment_count = 0

signal cliff_turn
signal switch_segment

var enemy_speed_for_3 = 295
var enemy_speed_for_between = 351
var enemy_speed_for_2 = 435
var enemy_speed = enemy_speed_for_3

var obstacle_speed_for_3 = 279
var obstacle_speed_for_between = 335
var obstacle_speed_for_2 = 419
var obstacle_speed = obstacle_speed_for_3

var pre_game_cutscene_started = false
var cutscene_ended = false

# warning-ignore:unused_argument
func _physics_process(delta):
	if rope_segment_count>=10:
		rope_segment_count = 0
		rope_segment = false
		emit_signal("switch_segment")
	if Global.is_plus_100 == 10:
		is_plus_100 = 0
# warning-ignore:unused_variable
		var Digit = int(rand_range(1,9))
		emit_signal("cliff_turn")
		pause_spawning = true
	if Input.is_action_just_pressed("game_tap"):
		pre_game_cutscene_started = true
		Global.game_over = false
	if Global.mile_score == 140:
		obstacle_speed = obstacle_speed_for_between
		enemy_speed = enemy_speed_for_between
	if Global.mile_score == 315:
		obstacle_speed = obstacle_speed_for_2
		enemy_speed = enemy_speed_for_2

func game_over_ex():
	pass
	

