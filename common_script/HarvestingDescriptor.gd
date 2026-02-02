class_name HarvestingDescriptor
extends Object

var initialHarvestingPoints: int
var harvestingTresholds: Array[int]
var actualLevel: int
var collectable: BaseCollectable
var elapsableParts : Dictionary[int, Array] = {}

func _init(_initialHarvestingPoints: int, _harvestingTresholds: Array[int], _collectable: BaseCollectable) -> void:
	initialHarvestingPoints = _initialHarvestingPoints
	harvestingTresholds = _harvestingTresholds
	collectable = _collectable
	actualLevel = harvestingTresholds.size() + 1

func onHarvested() -> void:
	initialHarvestingPoints -= 1
	if harvestingTresholds.has(initialHarvestingPoints):
		collectable.onHarvestingTresholdElapsed(initialHarvestingPoints)

func harvestingFinished() -> bool:
	return initialHarvestingPoints <= 0

func validate() -> void:
	assert(!harvestingTresholds.size() == 0)
	assert(!harvestingTresholds.max() >= initialHarvestingPoints)
	# TODO tresholds should be a descending sequence!!

func registerElapsableParts(treshold: int, partNames: Array[String], _collectable: BaseCollectable) -> void:
	assert(harvestingTresholds.has(treshold), str("invalid treshold --> ", str(treshold)))
	assert(!partNames.size() == 0, str("no parts provided --> ", str(_collectable)))
	elapsableParts.set(treshold, partNames)

func getElapsablePartsByTreshold(treshold: int) -> Array:
	if !elapsableParts.has(treshold):
		return []
	else:
		return elapsableParts.get(treshold)
