@abstract
class_name BaseLevel
extends Node3D

var playerInstance: PackedScene = preload("res://assets/player/Player.tscn")
var floorManager: FloorManager

func _ready() -> void:	
	GameManagerInstance.actualLevel = self
	floorManager = FloorManager.new()
	var plates = find_all_items(get_tree().root, [])
	for plate in plates:
		print(str("detected floor plate --> ", str(plate.name)))		
		floorManager.acceptPlate(plate)
	print(str("starting level ", str(self), ", ", "[", str(floorManager.getPlateCount()), "] ", " floor plates..."), str("(", floorManager.getStartPosition(), "->", floorManager.getEndPosition(), ")"))
	put_player()
	put_collectables()
	
func put_collectables() -> void:	
	var collectables = get_collectable_positions()
	print(str("putting ", str(collectables.size()), " collectables..."))
	var collectable_instance: BaseCollectable
	for collectable in collectables:		
		collectable_instance = CollectableFactoryInstance.make_collectable_instance(collectable.split("@")[0])			
		collectable_instance.global_position = floorManager.getPlatePosition(collectable.split("@")[1])		
		get_tree().get_current_scene().add_child(collectable_instance)
	
func put_player() -> void:	
	var player = playerInstance.instantiate()
	player.global_position = floorManager.getStartPosition()
	get_tree().get_current_scene().add_child(player)
	
func find_all_items(node, list) :
	var children = node.get_children()
	for child in children:
		if child is FloorPlate:
			list.append(child)
	for child in children:
		find_all_items(child, list)
	return list

@abstract
func get_collectable_positions() -> Array

func acceptPlayerPosition(position: Vector3) -> void:
	floorManager.acceptPlayerPosition(position)
