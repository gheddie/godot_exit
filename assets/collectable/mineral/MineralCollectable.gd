class_name MineralCollectable
extends BaseCollectable

func getMaxCollectableImpact() -> int:
	return 50

func getHarvestingTesholds() -> Array[int]:
	return [45,40,35,30,25,20,15,10]

func registerElapsableParts(harvestingDescriptor: HarvestingDescriptor) -> void:
	harvestingDescriptor.registerElapsableParts(45, ["Stroke1"], self)
	harvestingDescriptor.registerElapsableParts(40, ["Stroke2"], self)
	harvestingDescriptor.registerElapsableParts(35, ["Stroke3"], self)
	harvestingDescriptor.registerElapsableParts(30, ["Stroke4"], self)
	harvestingDescriptor.registerElapsableParts(25, ["Stroke5"], self)
	harvestingDescriptor.registerElapsableParts(20, ["Stroke6"], self)
	harvestingDescriptor.registerElapsableParts(15, ["Stroke7"], self)
	harvestingDescriptor.registerElapsableParts(10, ["Stroke8"], self)

func getDescriptor() -> String:
	return "Mineral"

func getWobbleFactor() -> float:
	return 0.75

func updateState() -> void:
	pass

func initialize() -> void:
	pass

func getDefaultMaterialKey() -> String:
	return ""
