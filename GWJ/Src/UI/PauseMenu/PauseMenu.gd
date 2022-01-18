extends Control


func _ready():
	hide()

func _input(event):
	if event is InputEventKey:
		if Input.is_action_just_pressed("open_PauseMenu"):
			visible = !visible
			get_tree().paused = visible

func _on_Resume_pressed():
	hide()
	get_tree().paused = false
	
func _on_Setting_pressed():
	$Menu/SettingPopUp.show()
	
func _on_MainMenu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Src/UI/MainMenu/MainMenu.tscn")
