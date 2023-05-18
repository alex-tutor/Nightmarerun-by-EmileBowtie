extends CanvasLayer


func _ready():
	pass 

# warning-ignore:unused_argument
func _physics_process(delta):
	if Global.game_started:
		visible = true
	else:
		visible = false
