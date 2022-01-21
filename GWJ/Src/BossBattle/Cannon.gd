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
			shoot()

func shoot():
	var shell = load("res://Src/BossBattle/Shell.tscn").instance()
	shell.global_position = global_position
	if scale.x == 1:
		shell.linear_velocity = shell.linear_velocity.rotated(200)
	else:
		shell.linear_velocity = shell.linear_velocity.rotated(180)
	get_parent().add_child(shell)

	var sfx = load("res://Src/Sound/SFX_Player.tscn").instance()
	var sfx_array = [
		load("res://Asset/Sound/SFX/Cannon_Fire_1.wav"),
		load("res://Asset/Sound/SFX/Cannon_Fire_2.wav")
	]
	sfx.stream = sfx_array[randi() % 2]
	add_child(sfx)
	


