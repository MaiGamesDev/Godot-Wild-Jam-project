extends CanvasLayer

export(int) var max_health = 6

const Heart = preload("res://Src/UI/Heart.tscn")
const HeartFull = preload("res://Asset/Art/Arix/UI/Heart_Full.png")
const HeartHalf = preload("res://Asset/Art/Arix/UI/Heart_Half.png")
const HeartEmpty = preload("res://Asset/Art/Arix/UI/Heart_Empty.png")

onready var health = max_health
onready var health_container = $Health

func _ready() -> void:
	GameManager.ui_manager = self
	init_health()
	update_health()

func player_hurt(damage):
	health -= damage
	if health <= 0:
		print("player dies")
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
