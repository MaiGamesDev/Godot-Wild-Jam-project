extends Node

var ui_manager
var coin_result = 0

func on_player_hurt(damage):
	ui_manager.player_hurt(damage)

func on_point_gain(gained):
	ui_manager.point_gain(gained)
