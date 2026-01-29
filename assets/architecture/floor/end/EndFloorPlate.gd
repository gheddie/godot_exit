class_name EndFloorPlate
extends FloorPlate

var exitTemplate: PackedScene = preload("res://assets/architecture/common/Exit.tscn")

func acceptPlayerPosition(_position: Vector3) -> void:
	pass

func initialize() -> void:
	add_child(exitTemplate.instantiate())

func tick() -> void:
	print(str("ticking --> ", str(self)))
