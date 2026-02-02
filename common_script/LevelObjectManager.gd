class_name LevelObjectManager
extends Object

var floorPlates : Dictionary[String, FloorPlate] = {}
var collectables : Dictionary[String, BaseCollectable] = {}
var platesWithCollectables: Array[String] = []

var levelItems: Array[LevelItem] = []

var startPlate : StartFloorPlate
var endPlate : EndFloorPlate

var watchDog : LevelObjectManagerWatchDog

func _init() -> void:
	watchDog = LevelObjectManagerWatchDog.new()

func acceptLevelObject(levelItem: LevelItem, level: BaseLevel) -> void:
	levelItem.initialize()
	levelItems.append(levelItem)
	watchDog.checkLevelObject(levelItem, level)
	if levelItem is FloorPlate:
		floorPlates.set(levelItem.name, levelItem)
		levelItem.initialize()
	if levelItem is StartFloorPlate:
		assert(startPlate == null, "start plate already set!!!")
		startPlate = levelItem
	if levelItem is EndFloorPlate:
		assert(endPlate == null, "end plate already set!!!")
		endPlate = levelItem
	if levelItem is BaseCollectable:
		collectables.set(str(levelItem.get_instance_id()), levelItem)

func getPlateByName(name: String) -> FloorPlate:
	var plate = floorPlates.get(name)
	assert(plate != null, str("plate by name {", name, "} not found!!!"))
	return plate

func getPlateCount() -> int:
	return floorPlates.size()
	
func getStartPosition() -> Vector3:
	return startPlate.global_position

func getEndPosition() -> Vector3:
	return endPlate.global_position

func getPlatePosition(name: String) -> Vector3:
	return getPlateByName(name).global_position

func acceptTargettedObject(targetted: Object, player: Player) -> void:
	if targetted is BaseCollectable:
		targetted.evaluatePlayerPosition(player.global_position)		
	if targetted is WallDoor:
		targetted.evaluatePlayerPosition(player.global_position)		
		
func watchObjects(level: BaseLevel) -> void:
	checkStartAndEndPosition(level)
	watchDog.summarize()

func checkStartAndEndPosition(level: BaseLevel) -> void:
	assert(startPlate != null, str("no start position set --> ", str(level)))
	assert(endPlate != null, str("no end position set --> ", str(level)))
	
func acceptCollectablePosition(plateName: String) -> void:
	assert(!platesWithCollectables.has(plateName), str("already a collectabe placed on plate --> ", str(plateName)))
	platesWithCollectables.append(plateName)

func updateLevelItems() -> void:
	for item in levelItems:
		if item != null:
			item.updateState()

func isCollectingInProcess() -> bool:
	for c in collectables.values():
		if is_instance_valid(c):
			if c.justHarvested:
				return true
	return false		
