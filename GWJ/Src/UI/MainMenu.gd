extends Node2D


func _ready():
	if OS.has_feature("HTML5"):
		$Buttons/Menu/Exit.hide()
		$MenuUI/UI/SettingPopUp/VBoxContainer/FullScreen.hide()

func _on_Start_pressed():
	pass # Replace with function body.

func _on_Setting_pressed():
	$MenuUI/UI/SettingPopUp.show()

func _on_Exit_pressed():
	get_tree().quit()
