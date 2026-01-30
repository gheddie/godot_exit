class_name SimpleBoxCollectable
extends BaseCollectable

func getMaxCollectableImpact() -> int:
	return 28

func getHarvestingTesholds() -> Array[int]:
	return [12,7]

func registerElapsableParts(harvestingDescriptor: HarvestingDescriptor) -> void:
	pass

func getDescriptor() -> String:
	return "SimpleBox"
