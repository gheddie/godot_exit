class_name PalmTreeCollectable
extends BaseCollectable

func getMaxCollectableImpact() -> int:
	return 75

func getHarvestingTesholds() -> Array[int]:
	return [45,40,35,30,25,20,15]

func registerElapsableParts(harvestingDescriptor: HarvestingDescriptor) -> void:	
	# leafs
	harvestingDescriptor.registerElapsableParts(45, ["Leaf1","Leaf3","Leaf5","Leaf7"], self)
	harvestingDescriptor.registerElapsableParts(40, ["Leaf2","Leaf4","Leaf6"], self)
	# trunks
	harvestingDescriptor.registerElapsableParts(35, ["Trunk5"], self)
	harvestingDescriptor.registerElapsableParts(30, ["Trunk4"], self)
	harvestingDescriptor.registerElapsableParts(25, ["Trunk3"], self)
	harvestingDescriptor.registerElapsableParts(20, ["Trunk2"], self)
	harvestingDescriptor.registerElapsableParts(15, ["Trunk1"], self)		

func getDescriptor() -> String:
	return "PalmTree"

func getWobbleFactor() -> float:
	return 0.9
