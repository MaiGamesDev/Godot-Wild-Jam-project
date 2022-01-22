class_name Cannon
extends Area2D

var isShellNear = false
var shell

func _on_area_entered(area):
	if area is ItemShell:
		isShellNear = true
		shell = area
		
func _on_area_exited(area):
	if area is ItemShell:
		isShellNear = false
		
func _input(event):
	if event is InputEventMouseButton:
		if Input.is_mouse_button_pressed(BUTTON_LEFT) and isShellNear:
			isShellNear = false
			
			for area in get_overlapping_areas():
				if area is ItemShell:
					area.queue_free()
			fire()

func fire():
	var shell = load("res://Src/BossBattle/Shell.tscn").instance()
	shell.global_position = $FirePos.global_position
	if scale.x == 1:
		shell.direction = Vector2.UP.rotated(0.5).normalized()
	else:
		shell.direction = Vector2.UP.rotated(-0.5).normalized()
	get_parent().add_child(shell)

	play_fire_sound()
	
	$Sprite.frame = 0
	$Sprite.play("fire")
	
func play_fire_sound():
	var sfx = load("res://Src/Sound/SFX_Player.tscn").instance()
	var sfx_array = [
		load("res://Asset/Sound/SFX/Cannon_Fire_1.wav"),
		load("res://Asset/Sound/SFX/Cannon_Fire_2.wav")
	]
	sfx.stream = sfx_array[randi() % 2]
	sfx.volume_db = -10
	add_child(sfx)
	

