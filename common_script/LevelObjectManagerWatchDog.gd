class_name LevelObjectManagerWatchDog
extends Object

var items: Array[Node3D] = []
var faultyItems: Array[Node3D] = []

const MIN_DISTANCE = 0.0

func checkLevelObject(levelItem: Node3D, level: BaseLevel) -> void:
	for item in items:
		var distanceToExisting = levelItem.global_position.distance_to(item.global_position)
		if distanceToExisting <= MIN_DISTANCE:
			# assert(false, str("item ", str(levelItem.name), " is not positioned correctly, level --> ", str(level)))		
			faultyItems.append(levelItem)
	items.append(levelItem)

func summarize() -> void:
	assert(faultyItems.size() == 0, summarizeFaultyObjects())

func summarizeFaultyObjects() -> String:
	return str("faulty positioned items (", str(faultyItems.size()), ")", faultyItems)
