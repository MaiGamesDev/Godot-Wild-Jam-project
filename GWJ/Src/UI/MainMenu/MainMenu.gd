extends Node2D


func _ready():
	if OS.has_feature("HTML5"):
		$Buttons/Menu/Exit.hide()
		$MenuUI/UI/SettingPopUp/VBoxContainer/FullScreen.hide()

func _on_Start_pressed():
	get_tree().change_scene("res://Src/UI/CutScene/Cutscene.tscn")

func _on_Setting_pressed():
	$MenuUI/UI/SettingPopUp.show()

func _on_Exit_pressed():
	get_tree().quit()


func _on_Rule_pressed():
	$MenuUI/UI/RulePopUp.show()


func _on_About_pressed():
	$MenuUI/UI/AboutPopUP.show()


