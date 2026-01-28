class_name GameManager
extends Node

var actualLevel: BaseLevel

func acceptPlayerPosition(position: Vector3) -> void:
	actualLevel.acceptPlayerPosition(position)
