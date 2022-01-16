extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	var shell = load("res://Src/Shell.tscn").instance()
	if scale.x == 1:
		shell.linear_velocity = shell.linear_velocity.rotated(200)
	else:
		shell.linear_velocity = shell.linear_velocity.rotated(180)
		

	
	add_child(shell)
