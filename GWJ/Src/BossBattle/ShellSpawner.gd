extends Node2D


func _ready():
	spawnShell()

func spawnShell():

	var itemShell = load("res://Src/BossBattle/ItemShell.tscn").instance()
	add_child(itemShell)
	yield(get_tree().create_timer(3.0),"timeout")
	
	spawnShell()
	
