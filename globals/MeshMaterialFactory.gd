class_name MeshMaterialFactory
extends Node

var meshMaterials : Dictionary[String, StandardMaterial3D] = {}

var defaultMaterials : Dictionary[String, StandardMaterial3D] = {}

func _init() -> void:
	initMeshMaterials()
	initDefaultMaterials()
	
func initMeshMaterials() -> void:
	
	meshMaterials.set("Mineral@Stroke1", getPinkMaterial())
	
	meshMaterials.set("Tank@P5", getGlassMaterial())
	
	meshMaterials.set("SimpleBox@UpperStandBreak", getDarkWoodMaterial())
	meshMaterials.set("SimpleBox@UpperStandBreak_001", getDarkWoodMaterial())
	meshMaterials.set("SimpleBox@UpperStandBreak_002", getDarkWoodMaterial())
	meshMaterials.set("SimpleBox@UpperStandBreak_003", getDarkWoodMaterial())
	meshMaterials.set("SimpleBox@LowerStandBreak", getDarkWoodMaterial())
	meshMaterials.set("SimpleBox@LowerStandBreak_001", getDarkWoodMaterial())
	meshMaterials.set("SimpleBox@LowerStandBreak_002", getDarkWoodMaterial())
	meshMaterials.set("SimpleBox@LowerStandBreak_003", getDarkWoodMaterial())
	meshMaterials.set("SimpleBox@Cover", getDarkWoodMaterial())	
	meshMaterials.set("SimpleBox@CoverSlice", getDarkWoodMaterial())
	meshMaterials.set("SimpleBox@Bottom", getDarkWoodMaterial())	
	meshMaterials.set("SimpleBox@BottomSlice", getDarkWoodMaterial())
	
func initDefaultMaterials() -> void:
	defaultMaterials.set("brightWood", getBrightWoodMaterial())

func getMaterial(meshKey: String, collectable: BaseCollectable) -> StandardMaterial3D:
	var material = meshMaterials.get(meshKey)
	if material != null:		
		return material
	else:
		print(str("no material defined for key --> ", meshKey))
		return getMaterialByKey(collectable.getDefaultMaterialKey())
		
static func getDarkWoodMaterial() -> StandardMaterial3D:
	var material = StandardMaterial3D.new()
	material.albedo_color = Color.SADDLE_BROWN
	return material
		
static func getBrightWoodMaterial() -> StandardMaterial3D:
	var material = StandardMaterial3D.new()
	material.albedo_color = Color.BURLYWOOD
	return material

static func getGlassMaterial() -> StandardMaterial3D:
	var material = StandardMaterial3D.new()
	material.albedo_color = Color.DEEP_PINK
	return material
	
static func getPinkMaterial() -> StandardMaterial3D:
	var material = StandardMaterial3D.new()
	material.albedo_color = Color.DEEP_PINK
	return material

func getMaterialByKey(materialKey: String) -> StandardMaterial3D:
	return defaultMaterials.get(materialKey)
