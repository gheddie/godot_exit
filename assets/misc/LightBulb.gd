class_name LightBulb
extends StaticBody3D

@onready var bulbOff: MeshInstance3D = $BulbOff

@onready var bulbGreen: MeshInstance3D = $BulbGreen
@onready var bulbRed: MeshInstance3D = $BulbRed

func _ready() -> void:	
	turnOff()
	
func turnOff() -> void:
	bulbOff.visible = true
	bulbGreen.visible = false
	bulbRed.visible = false
	
func turnRed() -> void:
	bulbOff.visible = false
	bulbGreen.visible = false
	bulbRed.visible = true
	
func turnGreen() -> void:
	bulbOff.visible = false
	bulbGreen.visible = true
	bulbRed.visible = false
