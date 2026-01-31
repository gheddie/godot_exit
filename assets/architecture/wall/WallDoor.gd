class_name WallDoor
extends StaticBody3D

@onready var player: AnimationPlayer = $AnimationPlayer
@onready var collisionShapeCenter: CollisionShape3D = $CollisionShapeCenter

var opened: bool = false

const DOOR_OFFSET = 1.0

func open() -> void:
	if !opened:
		player.play("OpenWing")
		opened = true

func evaluatePlayerPosition(playerPosition: Vector3) -> void:
	var distance = global_position.distance_to(position)	
	if distance <= DOOR_OFFSET:
		open()
		
func onOpenFinished() -> void:
	collisionShapeCenter.queue_free()
