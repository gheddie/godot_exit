class_name SimpleWallDoor
extends WallDoor

func canBeOpened() -> bool:
	return true

func updateState() -> void:
	pass

func initialize() -> void:
	turnLightsGreen()
