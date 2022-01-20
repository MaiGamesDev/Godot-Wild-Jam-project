extends Node2D

var tween_values = [50, 260]

func _ready():
	_start_tween()
	
func _start_tween():
	$Tween.interpolate_property(self, "position:x", tween_values[0], tween_values[1], 5.0, $Tween.TRANS_SINE, $Tween.EASE_IN_OUT)   
	$Tween.start()

func _on_tween_completed(object, key):
	tween_values.invert()
	_start_tween()

func shoot():
	var bullet = load("res://Src/BossBattle/BossBullet.tscn").instance()
	var player = $"../Player"
	var bullet_direction = (player.global_position - global_position).normalized()
	bullet.direction = bullet_direction
	bullet.position = position
	get_parent().add_child(bullet)


func _on_ShootCool_timeout():
	shoot()
	$ShootCool.wait_time = 2.0
