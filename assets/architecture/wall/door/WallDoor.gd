@abstract
class_name WallDoor
extends StaticBody3D

@onready var player: AnimationPlayer = $AnimationPlayer
@onready var collisionShapeCenter: CollisionShape3D = $CollisionShapeCenter
@onready var wing: Node3D = $DoorWing
@onready var bulb1: LightBulb = $Bulb1
@onready var bulb2: LightBulb = $Bulb2
@onready var bulb3: LightBulb = $Bulb3
@onready var bulb4: LightBulb = $Bulb4

var opened: bool = false

const DOOR_OFFSET = 1.0

func open() -> void:
	if canBeOpened():
		if !opened:
			player.play("OpenWing")
			opened = true
			bulb1.showGreen = true
			bulb2.showGreen = true
			bulb3.showGreen = true
			bulb4.showGreen = true

func evaluatePlayerPosition(_playerPosition: Vector3) -> void:
	var distance = global_position.distance_to(position)	
	if distance <= DOOR_OFFSET:
		open()
		
func onOpenFinished() -> void:
	collisionShapeCenter.queue_free()
	wing.queue_free()

@abstract
func canBeOpened() -> bool
