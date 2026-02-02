class_name SimpleBoxCollectable
extends BaseCollectable

func getMaxCollectableImpact() -> int:
	return 67

func getHarvestingTesholds() -> Array[int]:
	return [48,25,17,9]

func registerElapsableParts(harvestingDescriptor: HarvestingDescriptor) -> void:
	harvestingDescriptor.registerElapsableParts(48, ["CoverSlice"], self)
	harvestingDescriptor.registerElapsableParts(25, ["Cover"], self)
	harvestingDescriptor.registerElapsableParts(17, ["TopBreak3","TopBreak4","TopBreak7","TopBreak12"], self)
	harvestingDescriptor.registerElapsableParts(9, ["TopBreak5","TopBreak6","TopBreak9","TopBreak18","TopBreak19"], self)

func getDescriptor() -> String:
	return "SimpleBox"

func getWobbleFactor() -> float:
	return 0.75

func updateState() -> void:
	pass

func initialize() -> void:
	pass
