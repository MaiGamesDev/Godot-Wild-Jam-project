extends RigidBody2D

var direction = Vector2(0,0)
var speed = 120

var amethyst= load("res://Asset/Art/Boss/Boss_Projectile_A.png")
var diamond = load("res://Asset/Art/Boss/Boss_Projectile_D.png")
var emerald = load("res://Asset/Art/Boss/Boss_Projectile_E.png")
var ruby = load("res://Asset/Art/Boss/Boss_Projectile_R.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	var sprite_array = [
		amethyst,
		diamond,
		emerald,
		ruby
	]
	$Sprite.texture = sprite_array[randi() % sprite_array.size()]
	
	if direction.x < 0:
		angular_velocity *= -1
	linear_velocity = speed * direction
	
	
func _on_screen_exited():
	queue_free()


func _on_Hitbox_area_entered(area):
	if area.get_parent().has_method("on_hit"):
		queue_free()
		area.get_parent().on_hit(1)
