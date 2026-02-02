class_name TankCollectable
extends BaseCollectable

func getMaxCollectableImpact() -> int:
	return 24

func getHarvestingTesholds() -> Array[int]:
	return [21,18,15,12,9,6,3,0]
	
func registerElapsableParts(harvestingDescriptor: HarvestingDescriptor) -> void:
	harvestingDescriptor.registerElapsableParts(21, ["P1"], self)
	harvestingDescriptor.registerElapsableParts(18, ["P2"], self)
	harvestingDescriptor.registerElapsableParts(15, ["P3"], self)
	harvestingDescriptor.registerElapsableParts(12, ["P4"], self)
	harvestingDescriptor.registerElapsableParts(9, ["P5"], self)
	harvestingDescriptor.registerElapsableParts(6, ["P6"], self)
	harvestingDescriptor.registerElapsableParts(3, ["P7"], self)
	harvestingDescriptor.registerElapsableParts(0, ["P8"], self)

func getDescriptor() -> String:
	return "Tank"

func getWobbleFactor() -> float:
	return 0.85

func updateState() -> void:
	pass

func initialize() -> void:
	pass
