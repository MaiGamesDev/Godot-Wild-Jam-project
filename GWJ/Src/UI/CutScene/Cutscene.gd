extends Node2D

var current_animation

func _ready():
	$AnimationPlayer.play("cutsceneA")


func _on_Next_pressed():
	if current_animation == "cutsceneA":
		$AnimationPlayer.play("cutsceneB")
		current_animation = ""	
	if current_animation == "cutsceneB":
		$AnimationPlayer.play("cutsceneC")
		current_animation = ""
	if current_animation == "cutsceneC":
		get_tree().change_scene("res://Src/Main/Main.tscn")

func _on_AnimationPlayer_animation_finished(anim_name):
	current_animation = anim_name
