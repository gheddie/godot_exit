class_name SimpleBoxCollectable
extends BaseCollectable

func getMaxCollectableImpact() -> int:
	return 75

func getHarvestingTesholds() -> Array[int]:
	return [70,60,50,40,30,20,10,0]

func registerElapsableParts(harvestingDescriptor: HarvestingDescriptor) -> void:
	
	harvestingDescriptor.registerElapsableParts(70, ["CoverSlice"], self)
	harvestingDescriptor.registerElapsableParts(60, ["Cover"], self)
	
	harvestingDescriptor.registerElapsableParts(50, [
		"TopBreak1",
		"TopBreak1_001",
		"TopBreak1_002",
		"TopBreak1_003",
		"TopBreak2",
		"TopBreak2_001",
		"TopBreak2_002",
		"TopBreak2_003",
		"TopBreak3",
		"TopBreak3_001",
		"TopBreak3_002",
		"TopBreak3_003",
		"TopBreak4",
		"TopBreak4_001",
		"TopBreak4_002",
		"TopBreak4_003",
		"TopBreak5",
		"TopBreak5_001",
		"TopBreak5_002",
		"TopBreak5_003"
	], self)
	
	harvestingDescriptor.registerElapsableParts(40, [
		"LowerBreak1",
		"LowerBreak1_001",
		"LowerBreak1_002",
		"LowerBreak1_003",
		"LowerBreak2",
		"LowerBreak2_001",
		"LowerBreak2_002",
		"LowerBreak2_003",
		"LowerBreak3",
		"LowerBreak3_001",
		"LowerBreak3_002",
		"LowerBreak3_003",
		"LowerBreak4",
		"LowerBreak4_001",
		"LowerBreak4_002",
		"LowerBreak4_003",
		"LowerBreak5",
		"LowerBreak5_001",
		"LowerBreak5_002",
		"LowerBreak5_003"
	], self)
	
	harvestingDescriptor.registerElapsableParts(30, [
		"UpperStandBreak",
		"UpperStandBreak_001",
		"UpperStandBreak_002",
		"UpperStandBreak_003"
	], self)
	
	harvestingDescriptor.registerElapsableParts(20, [
		"LowerStandBreak",
		"LowerStandBreak_001",
		"LowerStandBreak_002",
		"LowerStandBreak_003"
	], self)
	
	harvestingDescriptor.registerElapsableParts(10, ["BottomSlice"], self)
	harvestingDescriptor.registerElapsableParts(0, ["Bottom"], self)

func getDescriptor() -> String:
	return "SimpleBox"

func getWobbleFactor() -> float:
	return 0.75

func updateState() -> void:
	pass

func initialize() -> void:	
	pass

func getDefaultMaterialKey() -> String:
	return "brightWood"
