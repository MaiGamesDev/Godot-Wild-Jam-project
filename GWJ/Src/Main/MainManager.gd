extends Node


export(String, FILE, "*.tscn") var first_scene

var is_got_key = false

var coin_result = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if first_scene != null:
		print(first_scene)
		add_child(load(first_scene).instance())

func change_level(scene):
	
	if scene == "res://Src/UI/GameEnd/GameEnd.tscn":
		GameManager.coin_result = $UI.point
		get_tree().change_scene(scene)
	elif scene == "res://Src/Main/Level7.tscn":
		get_child(1).queue_free()
		add_child(load(scene).instance())
		$UI.update_levelName(scene)	
	else:
		get_child(2).queue_free()
		add_child(load(scene).instance())
		$UI.update_levelName(scene)
		
		if scene == "res://Src/Main/Level6.tscn":
			$LevelMusic.queue_free()
