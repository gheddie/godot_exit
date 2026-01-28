@abstract
class_name BaseLevel
extends Node3D

var playerInstance: PackedScene = preload("res://assets/player/Player.tscn")
var levelObjectManager: LevelObjectManager

func _ready() -> void:	
	GameManagerInstance.actualLevel = self
	levelObjectManager = LevelObjectManager.new()
	var floorPlates = findFloorPlates(get_tree().root, [])
	for floorPlate in floorPlates:
		levelObjectManager.acceptLevelObject(floorPlate)
	var doors = findDoors(get_tree().root, [])
	for door in doors:
		levelObjectManager.acceptLevelObject(door)
	print(str("starting level ", str(self), ", ", "[", str(levelObjectManager.getPlateCount()), "] ", " floor plates..."), str("(", levelObjectManager.getStartPosition(), "->", levelObjectManager.getEndPosition(), ")"))
	put_player()
	put_collectables()	
	
func put_collectables() -> void:	
	var collectables = get_collectable_positions()
	print(str("putting ", str(collectables.size()), " collectables..."))
	var collectable_instance: BaseCollectable
	for collectable in collectables:		
		collectable_instance = CollectableFactoryInstance.make_collectable_instance(collectable.split("@")[0])			
		collectable_instance.global_position = levelObjectManager.getPlatePosition(collectable.split("@")[1])		
		get_tree().get_current_scene().add_child(collectable_instance)
	
func put_player() -> void:	
	var player = playerInstance.instantiate()
	player.global_position = levelObjectManager.getStartPosition()
	get_tree().get_current_scene().add_child(player)
	
func findFloorPlates(node, list) :
	var children = node.get_children()
	for child in children:
		if child is FloorPlate:
			list.append(child)
	for child in children:
		findFloorPlates(child, list)
	return list
	
func findDoors(node, list) :
	var children = node.get_children()
	for child in children:
		if child is WallDoor:
			list.append(child)
	for child in children:
		findDoors(child, list)
	return list

@abstract
func get_collectable_positions() -> Array

func acceptPlayerPosition(position: Vector3) -> void:
	levelObjectManager.acceptPlayerPosition(position)
