extends RigidBody2D

var direction = Vector2(0,0)
var speed = 80

var clay_pot = load("res://Asset/Art/Arix/Static/Clay_Pot2.png")
var coin = load("res://Asset/Art/Arix/Static/Coin.png")
var necless = load("res://Asset/Art/Arix/Static/Neckless.png")
var skull = load("res://Asset/Art/Arix/Static/Skull.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	var sprite_array = [
		clay_pot,
		coin,
		necless,
		skull
	]
	$Sprite.texture = sprite_array[randi() % sprite_array.size()]
	
	linear_velocity = speed * direction
	
func _on_screen_exited():
	queue_free()


func _on_Hitbox_area_entered(area):
	if area.get_parent().has_method("on_hit"):
		queue_free()
		area.get_parent().on_hit(1)
