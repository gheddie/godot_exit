class_name LevelObjectManager
extends Object

var floorPlates : Dictionary[String, FloorPlate] = {}
var doors : Dictionary[String, WallDoor] = {}
var collectables : Dictionary[String, BaseCollectable] = {}

var startPlate : StartFloorPlate
var endPlate : EndFloorPlate

func acceptLevelObject(levelItem: Node3D) -> void:	
	# levelItem.initialize()
	if levelItem is FloorPlate:
		floorPlates.set(levelItem.name, levelItem)
	if levelItem is StartFloorPlate:
		startPlate = levelItem
	if levelItem is EndFloorPlate:
		endPlate = levelItem
	if levelItem is WallDoor:
		doors.set(levelItem.name, levelItem)
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

func acceptPlayerPosition(position: Vector3) -> void:
	for plate in floorPlates.values():
		plate.acceptPlayerPosition(position)
	for door in doors.values():
		door.acceptPlayerPosition(position)
	for collectable in collectables.values():
		if collectable != null:
			collectable.acceptPlayerPosition(position)		
		pass
