class_name HandledWallDoor
extends WallDoor

func canBeOpened() -> bool:
	return true

func updateState() -> void:
	pass

func initialize() -> void:
	pass

func evaluatePlayerPosition(_playerPosition: Vector3) -> void:
	# do nothing
	pass
