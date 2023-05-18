extends Node2D

func _ready():
# warning-ignore:return_value_discarded
	Global.connect("cliff_turn",self,"on_cliff_turn_here")
	randomize()

onready var timer = $Timer

var coin_resource = preload("res://IN-GAME-VALUABLES/Coin.tscn")
var skull_resource = preload("res://IN-GAME-VALUABLES/Skull.tscn")
var can_check_for_mini
var can_check_for_tall
var can_check_for_slide

var mini = preload("res://In-Game-Obstacles/Mini-Obstacle.tscn")
var tall = preload("res://In-Game-Obstacles/Tall-Obstacle.tscn")
var flying_SAFE = preload("res://In-Game-Obstacles/Flying-Obstacle.tscn")
var flying_DANGER = preload("res://In-Game-Obstacles/FlyingDANGER.tscn")
var sliding_obstacle = preload("res://In-Game-Obstacles/Sliding-Obstacle.tscn")
var enemy_scene = preload("res://IN-GAME-ENEMY/Enemy.tscn")
var rockspike_scene = preload("res://In-Game-Obstacles/RockSpikeWR.tscn")
var rope_scene = preload("res://Background-Floor/Rope.tscn")

var ON_COMING_OBSTACLES = [mini, tall, flying_SAFE, mini, flying_DANGER, tall, sliding_obstacle]

func obstacle_spawning():
	if Global.game_started&&!Global.game_over&&!Global.pause_spawning:
		randomize()
		var obstacle_scene = ON_COMING_OBSTACLES[randi()%ON_COMING_OBSTACLES.size()]
		var obstacle = obstacle_scene.instance()
		if obstacle_scene == mini:
			can_check_for_tall = false
			can_check_for_mini = true
			can_check_for_slide = false
			if can_check_for_mini:
				var digit_for_mini = int(rand_range(1,4))
				if digit_for_mini == 1:
					var enemy = enemy_scene.instance()
					var skull = skull_resource.instance()
					skull.position = Vector2(1250,364)
					enemy.position = Vector2(1250,364)
					add_child(skull)
					add_child(enemy)
				else:
					var coin1 = coin_resource.instance()
					var coin2 = coin_resource.instance()
					var coin3 = coin_resource.instance()
					var coin4 = coin_resource.instance()
					coin4.position = Vector2(1227,372)
					coin3.position = Vector2(1177,372)
					coin2.position = Vector2(1127,372)
					coin1.position = Vector2(1077,372)
					add_child(coin1)
					add_child(coin2)
					add_child(coin3)
					add_child(coin4)
		else:
			can_check_for_mini = false
		if obstacle_scene == flying_SAFE:
			can_check_for_mini = false
			can_check_for_tall = false
			can_check_for_slide = false
			var coin1_FS = coin_resource.instance()
			var coin2_FS = coin_resource.instance()
			var coin3_FS = coin_resource.instance()
			var coin4_FS = coin_resource.instance()
			coin4_FS.position = Vector2(933,133)
			coin3_FS.position = Vector2(983,133)
			coin2_FS.position = Vector2(1032,133)
			coin1_FS.position = Vector2(1084,133)
			add_child(coin1_FS)
			add_child(coin2_FS)
			add_child(coin3_FS)
			add_child(coin4_FS)
		if obstacle_scene == tall:
			can_check_for_slide = false
			can_check_for_mini = false
			can_check_for_tall = true
			if can_check_for_tall:
				var digit_for_tall = int(rand_range(1,4))
				if digit_for_tall == 1:
					var enemy = enemy_scene.instance()
					var skull = skull_resource.instance()
					skull.position = Vector2(1250,364)
					enemy.position = Vector2(1250,364)
					add_child(skull)
					add_child(enemy)
				else:
					var coin1 = coin_resource.instance()
					var coin2 = coin_resource.instance()
					var coin3 = coin_resource.instance()
					var coin4 = coin_resource.instance()
					coin4.position = Vector2(1227,372)
					coin3.position = Vector2(1177,372)
					coin2.position = Vector2(1127,372)
					coin1.position = Vector2(1077,372)
					add_child(coin1)
					add_child(coin2)
					add_child(coin3)
					add_child(coin4)
		else:
			can_check_for_tall = false
		if obstacle_scene == sliding_obstacle:
			can_check_for_mini = false
			can_check_for_tall = false
			can_check_for_slide = true
			if can_check_for_slide:
				var digit_for_slide = int(rand_range(1,4))
				if digit_for_slide == 1:
					var enemy = enemy_scene.instance()
					var skull = skull_resource.instance()
					skull.position = Vector2(1250,364)
					enemy.position = Vector2(1250,364)
					add_child(skull)
					add_child(enemy)
				else:
					var coin1 = coin_resource.instance()
					var coin2 = coin_resource.instance()
					var coin3 = coin_resource.instance()
					var coin4 = coin_resource.instance()
					coin4.position = Vector2(1227,372)
					coin3.position = Vector2(1177,372)
					coin2.position = Vector2(1127,372)
					coin1.position = Vector2(1077,372)
					add_child(coin1)
					add_child(coin2)
					add_child(coin3)
					add_child(coin4)
		else:
			can_check_for_slide = false
		add_child(obstacle)

func _on_Timer_timeout():
	if Global.game_started:
		obstacle_spawning()

func on_cliff_turn_here():
	var rope = rope_scene.instance()
	rope.position = Vector2(1661,171)
	var spike = rockspike_scene.instance()
	spike.position = Vector2(1641,69)
	add_child(spike)
	add_child(rope)
	Global.stop_starting_CT = true
