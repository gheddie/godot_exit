@abstract
class_name BaseLevel
extends Node3D

var playerInstance: PackedScene = preload("res://assets/player/Player.tscn")
var levelObjectManager: LevelObjectManager
var objectTimer : Timer
var player : Player

const TIMER_OBJECT_TIMEOUT = 0.25

func initObjectTimer() -> void:
	objectTimer = Timer.new()
	add_child(objectTimer)
	objectTimer.wait_time = TIMER_OBJECT_TIMEOUT	
	objectTimer.start()
	objectTimer.connect("timeout", onTimerElapsed)			
	
func onTimerElapsed() -> void:
	var targettedObjects = player.getTargettedObjects()
	for targetted in targettedObjects:	
		levelObjectManager.acceptTargettedObject(targetted, player)

func _ready() -> void:	
	initObjectTimer()
	GameManagerInstance.actualLevel = self
	levelObjectManager = LevelObjectManager.new()
	var floorPlates = findFloorPlates(get_tree().root, [])
	for floorPlate in floorPlates:
		levelObjectManager.acceptLevelObject(floorPlate, self)
	var doors = findDoors(get_tree().root, [])
	for door in doors:
		levelObjectManager.acceptLevelObject(door, self)
	levelObjectManager.watchObjects(self)
	put_player()
	put_collectables()	
	
func put_collectables() -> void:	
	var collectables = getCollectablePositions()
	print(str("putting ", str(collectables.size()), " collectables..."))
	var collectableInstance: BaseCollectable
	for collectable in collectables:		
		var collectableType = collectable.split("@")[0]
		var collectablePlateName = collectable.split("@")[1]		
		levelObjectManager.acceptCollectablePosition(collectablePlateName)
		collectableInstance = CollectableFactoryInstance.makeCollectableInstance(collectableType)
		collectableInstance.global_position = levelObjectManager.getPlatePosition(collectablePlateName)				
		get_tree().get_current_scene().add_child(collectableInstance)
		levelObjectManager.acceptLevelObject(collectableInstance, self)
	
func put_player() -> void:	
	player = playerInstance.instantiate()
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
func getCollectablePositions() -> Array
