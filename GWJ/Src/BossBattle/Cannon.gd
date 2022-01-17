
class_name Cannon
extends Area2D

func _on_area_entered(area):
	if area is ItemShell:
		area.queue_free()
		
		var shell = load("res://Src/BossBattle/Shell.tscn").instance()
		if scale.x == 1:
			shell.linear_velocity = shell.linear_velocity.rotated(200)
		else:
			shell.linear_velocity = shell.linear_velocity.rotated(180)
		add_child(shell)
