extends Node

export var level_name = ""
export(String, FILE, "*.tscn") var next_scene
# Called when the node enters the scene tree for the first time.


func _on_LevelEnd_body_entered(body):
	get_parent().change_level(next_scene)
