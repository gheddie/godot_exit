class_name CollectableFactory
extends Node

var templates : Dictionary[String, PackedScene] = {}

func _ready() -> void:
	templates.set("simplebox", preload("res://assets/collectable/simplebox/SimpleBoxCollectable.tscn"))
	templates.set("mineral", preload("res://assets/collectable/mineral/MineralCollectable.tscn"))
	templates.set("palmtree", preload("res://assets/collectable/palmtree/PalmTreeCollectable.tscn"))
	templates.set("tank", preload("res://assets/collectable/tank/TankCollectable.tscn"))

func makeCollectableInstance(type: String) -> BaseCollectable:
	assert(templates.has(type) != null, str("unregistered collectable type --> ", type))
	var instance = templates.get(type).instantiate()	
	applyMaterials(instance)
	return instance

func applyMaterials(collectable: BaseCollectable) -> void:
	"""
	for meshKey in collectable.mappedMeshes:
		# print(collectable.mappedMeshes.get(meshKey))
		print(meshKey)
		"""
	pass
