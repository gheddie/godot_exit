class_name CollectableFactory
extends Node

var templates : Dictionary[String, PackedScene] = {}

func _ready() -> void:
	templates.set("simplebox", preload("res://assets/collectable/simplebox/SimpleBoxCollectable.tscn"))
	templates.set("mineral", preload("res://assets/collectable/mineral/MineralCollectable.tscn"))
	templates.set("palmtree", preload("res://assets/collectable/palmtree/PalmTreeCollectable.tscn"))

func makeCollectableInstance(type: String) -> BaseCollectable:
	assert(templates.has(type) != null, str("unregistered collectable type --> ", type))
	# print(str("making collectable of type {", type, "}"))
	return templates.get(type).instantiate()
