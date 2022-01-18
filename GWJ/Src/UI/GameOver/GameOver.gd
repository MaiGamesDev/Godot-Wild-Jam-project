extends Node2D


var tween_values = [-1200, 0]

func _ready():
	_start_tween()

func _start_tween():
	$Tween.interpolate_property($BackGround/GameOverMan, "position:y", tween_values[0], tween_values[1], 1.5, $Tween.TRANS_SINE, $Tween.EASE_IN_OUT)   
	$Tween.start()

func _on_tween_completed(object, key):
	$AnimationPlayer.play("fadeIn")




func _on_MainMenu_pressed():
	get_tree().change_scene("res://Src/UI/MainMenu/MainMenu.tscn")
