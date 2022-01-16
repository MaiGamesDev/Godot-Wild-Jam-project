extends Sprite

var y_max = 25
var speed = 15

var y_origin
var y_go_up = true

func _ready():
	y_origin = position.y

func _process(delta):
	goUpDown(delta)
		
func goUpDown(delta):
	if y_go_up:
		position.y -= speed * delta
		if position.y < y_origin - y_max:
			y_go_up = false
	else:
		position.y += speed * delta
		if position.y > y_origin:
			y_go_up = true
	
	
