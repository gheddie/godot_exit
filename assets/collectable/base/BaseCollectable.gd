@abstract
class_name BaseCollectable
extends LevelItem

const HARVESTING_OFFSET = 3.5
const WOBBLE_INTERVAL = 0.05

var harvestingDescriptor: HarvestingDescriptor
var mappedMeshes: Dictionary
var justHarvested: bool = false

func _init() -> void:	
	harvestingDescriptor = HarvestingDescriptor.new(getMaxCollectableImpact(), getHarvestingTesholds(), self)
	harvestingDescriptor.validate()	
	registerElapsableParts(harvestingDescriptor)
	# initialize()
	
func _ready() -> void:
	mappedMeshes = TreeUtil.mapSceneObjects(self, {})	
	logMappedMeshes(mappedMeshes)
	for mesh in mappedMeshes.values():
		applyMaterial(mesh)
		
func logMappedMeshes(meshes: Dictionary) -> void:
	var meshNameList: Array[String] = []
	for meshName in meshes:
		# print(meshName)
		meshNameList.append(meshName)
	print("------------------------------------------------")
	print(str("map ojects for collectable --> ", getDescriptor()))
	print("------------------------------------------------")	
	for name in StringUtil.sortStringArray(meshNameList):
		print(name)
	print("------------------------------------------------")		

func applyMaterial(mesh: MeshInstance3D) -> void:
	mesh.material_override = getMaterial(buildMeshKey(mesh))		
	
func buildMeshKey(mesh: MeshInstance3D) -> String:
	return getDescriptor() + "@" + mesh.name
		
func harvestMe(playerPosition: Vector3) -> void:
	var distance = global_position.distance_to(playerPosition)
	if distance <= HARVESTING_OFFSET:
		justHarvested = true
		wobble()
		harvestingDescriptor.onHarvested()
		if harvestingDescriptor.harvestingFinished():
			harvestingFinished()
	else:
		justHarvested = false

func wobble() -> void:		
	var origScale = scale
	var tweenedScale = scale * getWobbleFactor()
	var tween = create_tween()	
	tween.tween_property(self, "scale", tweenedScale, WOBBLE_INTERVAL)
	tween.tween_property(self, "scale", origScale, WOBBLE_INTERVAL)	

func harvestingFinished() -> void:
	queue_free()	

func evaluatePlayerPosition(playerPosition: Vector3) -> void:
	harvestMe(playerPosition)
	
func onHarvestingTresholdElapsed(elapsedTreshold: int) -> void:
	# print(str("onHarvestingTresholdElapsed --> ", str(elapsedTreshold)))
	for part in harvestingDescriptor.getElapsablePartsByTreshold(elapsedTreshold):
		var mesh: MeshInstance3D = mappedMeshes.get(part)
		# print(str("removing part --> ", str(mesh), str(" of collectable: "), str(getDescriptor())))				
		assert(mesh != null, str("mesh nout found --> ", part))
		mesh.queue_free()
		GameManagerInstance.collectableCash.acceptCollectables(self, 10)
		# GameManagerInstance.collectableCash.debug()
		
func getMaterial(meshKey: String) -> StandardMaterial3D:
	return MeshMaterialFactoryInstance.getMaterial(meshKey, self)

@abstract	
func getDefaultMaterialKey() -> String

@abstract
func getMaxCollectableImpact() -> int

@abstract
func getHarvestingTesholds() -> Array[int]

@abstract
func registerElapsableParts(_harvestingDescriptor: HarvestingDescriptor) -> void

@abstract
func getDescriptor() -> String

@abstract
func getWobbleFactor() -> float
