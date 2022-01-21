extends Area2D

var boss_life = 3
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
	$Sprite.play("attack")
	yield(get_tree().create_timer(0.38),"timeout")
	
	var bullet = load("res://Src/BossBattle/BossBullet.tscn").instance()
	var player = $"../Player"
	var bullet_direction = (player.global_position - global_position).normalized()
	bullet.direction = bullet_direction
	bullet.global_position = $ShootPos.global_position
	get_parent().add_child(bullet)


func _on_ShootCool_timeout():
	shoot()
	$ShootCool.wait_time = 3.0

func hurt():
	boss_life -= 1
	print(boss_life)
	if boss_life < 1:
		die()
	else:
		$Sprite.play("hurt")

func die():
	$Tween.stop_all()
	$ShootCool.stop()
	$Sprite.play("die")

func _on_animation_finished():
	if $Sprite.animation == "die":
		queue_free()
	$Sprite.frame = 0
	$Sprite.play("walk")


func _on_body_entered(body):
	if body is Shell:
		body.queue_free()
		hurt()
