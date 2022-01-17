extends Node2D

var isTakenToPlayer = false

func _process(delta):
	pass


func _on_Area2D_body_entered(body):
	if body is Player:
		isTakenToPlayer
