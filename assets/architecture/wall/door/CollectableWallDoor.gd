class_name CollectableWallDoor
extends WallDoor

func canBeOpened() -> bool:
	return GameManagerInstance.collectableCash.getTotalAmount() > 0
