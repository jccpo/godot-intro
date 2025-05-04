extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate(body):
	print("player has entered gate")
	print(body)


func _on_player_player_shot_laser(pos):
	var laser = laser_scene.instantiate()
	#1. Update the laser position
	laser.position = pos
	#3. Add the laser instance to a node 2d
	$Projectiles.add_child(laser)

func _on_player_player_threw_grenade(pos):
	var grenade = grenade_scene.instantiate()
	grenade.position = pos
	$Projectiles.add_child(grenade)
