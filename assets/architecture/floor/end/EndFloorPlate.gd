class_name EndFloorPlate
extends FloorPlate

const END_OFFSET = 5.0

func acceptPlayerPosition(_position: Vector3) -> void:
	var distanceToEnd = global_position.distance_to(_position)	
	if distanceToEnd <= END_OFFSET:
		LevelProviderInstance.levelFinished()

func initialize() -> void:
	pass
