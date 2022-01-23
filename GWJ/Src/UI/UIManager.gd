extends CanvasLayer

const Heart = preload("res://Src/UI/Heart.tscn")
const HeartFull = preload("res://Asset/Art/Arix/UI/Heart_Full.png")
const HeartHalf = preload("res://Asset/Art/Arix/UI/Heart_Half.png")
const HeartEmpty = preload("res://Asset/Art/Arix/UI/Heart_Empty.png")

export(int) var max_health = 6

var point = 0

onready var health = max_health
onready var health_container = $Health
onready var point_container = $Point/Label
onready var levelName_container = $LevelName/Label


func _ready() -> void:
	GameManager.ui_manager = self
	init_health()
	update_health()
	update_point()
	
	yield(get_tree().create_timer(0.1),"timeout")
	update_levelName("res://Src/Main/Level1.tscn")

func player_hurt(damage):
	health -= damage
	if health <= 0:
		health = 0
		print("player dies")
		get_tree().change_scene("res://Src/UI/GameOver/GameOver.tscn")
	elif health >= max_health:
		health = max_health
	
	if damage > 0:
		play_hurt_sound()
	else:
		play_heart_gain_sound()
	
	update_health()

func init_health():
	for i in max_health / 2:
		var heart = Heart.instance()
		health_container.add_child(heart)

func update_health():
	var i = 0
	while i < health / 2:
		health_container.get_child(i).texture = HeartFull
		i += 1
	
	if health % 2 == 1:
		health_container.get_child(i).texture = HeartHalf
		i += 1
	
	while i < max_health / 2:
		health_container.get_child(i).texture = HeartEmpty
		i += 1

func point_gain(gained):
	point += gained
	update_point()
	

func update_point():
	point_container.text = str(point) 

func update_levelName(scene):
	match scene:
		"res://Src/Main/Level1.tscn":
			levelName_container.text = "Stern Deck"
		"res://Src/Main/Level2.tscn":
			levelName_container.text = "1F Main Hall"
		"res://Src/Main/Level3.tscn":
			levelName_container.text = "2F Sailors Bedroom"
		"res://Src/Main/Level4.tscn":
			levelName_container.text = "3F Captain's Room"
		"res://Src/Main/Level5.tscn":
			levelName_container.text = "B1 Hallway"
		"res://Src/Main/Level6.tscn":
			levelName_container.text = "Bling Crap's Hideout"
		"res://Src/Main/Level7.tscn":
			levelName_container.text = "The Storage"
		"res://Src/Main/Level2_B.tscn":
			levelName_container.text = "1F Main Hall"


func play_hurt_sound():
	var sound_array = [
		load("res://Asset/Sound/SFX/Player_Hurt_1.wav"),
		load("res://Asset/Sound/SFX/Player_Hurt_2.wav")
	]
	var sfx = load("res://Src/Sound/SFX_Player.tscn").instance()
	sfx.stream = sound_array[randi() % sound_array.size()]
	sfx.volume_db = 0
	add_child(sfx)
	
func play_heart_gain_sound():
	var sfx = load("res://Src/Sound/SFX_Player.tscn").instance()
	sfx.stream = load("res://Asset/Sound/SFX/Heart_gain.wav")
	sfx.volume_db = 0
	add_child(sfx)
	
