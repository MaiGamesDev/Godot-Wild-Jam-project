extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("FadeIn")
	$EndUI/UI/MoneyEarned/Value.text = str(GameManager.coin_result)


func _on_MainMenu_pressed():
	get_tree().change_scene("res://Src/UI/MainMenu/MainMenu.tscn")


func _on_Retry_pressed():
	get_tree().change_scene("res://Src/Main/Main.tscn")
