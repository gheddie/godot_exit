class_name CollectableWallDoor
extends WallDoor

func canBeOpened() -> bool:
	return GameManagerInstance.collectableCash.getTotalAmount() > 0

func updateState() -> void:
	if canBeOpened():
		turnLightsGreen()

func initialize() -> void:
	turnLightsRed()
