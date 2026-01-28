class_name EndFloorPlate
extends FloorPlate

func acceptPlayerPosition(position: Vector3) -> void:
	print(global_position.distance_to(position))

func initialize() -> void:
	pass
