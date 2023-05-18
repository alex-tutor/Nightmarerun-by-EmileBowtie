extends Label


func _ready():
	self.text = str(Global.coin_score)

# warning-ignore:unused_argument
func _physics_process(delta):
	self.text = str(Global.coin_score)
