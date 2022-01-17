extends Node

var ui_manager

func on_player_hurt(damage):
	ui_manager.player_hurt(damage)
