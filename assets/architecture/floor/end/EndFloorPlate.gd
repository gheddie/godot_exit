class_name EndFloorPlate
extends FloorPlate

var exitTemplate: PackedScene = preload("res://assets/architecture/common/Exit.tscn")

func initialize() -> void:
	add_child(exitTemplate.instantiate())
