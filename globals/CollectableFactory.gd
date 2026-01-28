class_name CollectableFactory
extends Node

var blue_template: PackedScene = preload("res://assets/collectable/blue/BlueCollectable.tscn")
var red_template: PackedScene = preload("res://assets/collectable/red/RedCollectable.tscn")
var green_template: PackedScene = preload("res://assets/collectable/green/GreenCollectable.tscn")

var templates : Dictionary[String, PackedScene] = {}

func _ready() -> void:
	templates.set("blue", preload("res://assets/collectable/blue/BlueCollectable.tscn"))
	templates.set("red", preload("res://assets/collectable/red/RedCollectable.tscn"))
	templates.set("green", preload("res://assets/collectable/green/GreenCollectable.tscn"))

func makeCollectableInstance(type: String) -> BaseCollectable:
	print(str("making collectable of type {", type, "}"))
	return templates.get(type).instantiate()
