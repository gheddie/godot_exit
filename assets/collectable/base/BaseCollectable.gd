@abstract
class_name BaseCollectable
extends StaticBody3D

const HARVESTING_OFFSET = 3.5
const WOBBLE_INTERVAL = 0.05

var harvestingDescriptor: HarvestingDescriptor
var mappedMeshes: Dictionary

func _init() -> void:	
	harvestingDescriptor = HarvestingDescriptor.new(getMaxCollectableImpact(), getHarvestingTesholds(), self)
	harvestingDescriptor.validate()	
	registerElapsableParts(harvestingDescriptor)
	
func _ready() -> void:
	mappedMeshes = TreeUtil.mapSceneObjects(self, {})	

func harvestMe(playerPosition: Vector3) -> void:
	var distance = global_position.distance_to(playerPosition)
	if distance <= HARVESTING_OFFSET:
		wobble()
		harvestingDescriptor.onHarvested()
		if harvestingDescriptor.harvestingFinished():
			harvestingFinished()

func wobble() -> void:		
	var origScale = scale
	var tweenedScale = scale * 0.75	
	var tween = create_tween()	
	tween.tween_property(self, "scale", tweenedScale, WOBBLE_INTERVAL)
	tween.tween_property(self, "scale", origScale, WOBBLE_INTERVAL)	

func harvestingFinished() -> void:
	queue_free()	

func evaluatePlayerPosition(playerPosition: Vector3) -> void:
	harvestMe(playerPosition)
	
func onHarvestingTresholdElapsed(elapsedTreshold: int) -> void:
	print(str("onHarvestingTresholdElapsed --> ", str(elapsedTreshold)))
	for part in harvestingDescriptor.getElapsablePartsByTreshold(elapsedTreshold):
		var mesh: MeshInstance3D = mappedMeshes.get(part)
		# print(str("removing part --> ", str(mesh), str(" of collectable: "), str(getDescriptor())))				
		mesh.queue_free()
	
@abstract
func getMaxCollectableImpact() -> int

@abstract
func getHarvestingTesholds() -> Array[int]

@abstract
func registerElapsableParts(harvestingDescriptor: HarvestingDescriptor) -> void

@abstract
func getDescriptor() -> String
