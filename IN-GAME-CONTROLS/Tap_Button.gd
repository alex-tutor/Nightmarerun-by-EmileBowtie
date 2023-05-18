extends TouchScreenButton



func _ready():
	pass 

# warning-ignore:unused_argument
func _physics_process(delta):
	if Global.pre_game_cutscene_started:
		visible = false
