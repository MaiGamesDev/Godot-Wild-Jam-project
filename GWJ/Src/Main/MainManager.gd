extends Node


export(String, FILE, "*.tscn") var first_scene

var is_got_key = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if first_scene != null:
		add_child(load(first_scene).instance())

func change_level(scene):
	
	if scene == "res://Src/UI/GameEnd/GameEnd.tscn":
		get_tree().change_scene(scene)
	else:
		$Game.queue_free()
		add_child(load(scene).instance())
		$UI.update_levelName()
		
		if scene == "res://Src/Main/Level6.tscn":
			$LevelMusic.queue_free()