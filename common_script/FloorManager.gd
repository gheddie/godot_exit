class_name FloorManager
extends Object

var floorPlates : Dictionary[String, FloorPlate] = {}
var startPlate : StartFloorPlate
var endPlate : EndFloorPlate

func acceptPlate(plate: FloorPlate) -> void:	
	plate.initialize()
	if plate is StartFloorPlate:
		startPlate = plate
	if plate is EndFloorPlate:
		endPlate = plate
	floorPlates.set(plate.name, plate)

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
