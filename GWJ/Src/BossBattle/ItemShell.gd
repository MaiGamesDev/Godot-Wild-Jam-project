class_name ItemShell

extends Area2D

var isTakenToPlayer = false

func _process(delta):
	if isTakenToPlayer:
		global_position = $"../../Player".position + Vector2(0, -10)


func _on_body_entered(body):
	if body is Player:
		isTakenToPlayer = true

