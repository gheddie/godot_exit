class_name WallDoor
extends StaticBody3D

@onready var player: AnimationPlayer = $WallDoor/AnimationPlayer
@onready var collisionShape: CollisionShape3D = $CollisionShape3D

var opened: bool = false

const DOOR_OFFSET = 1.0

func open() -> void:
	if !opened:
		player.play("OpenDoorWing")
		collisionShape.queue_free()
		opened = true

func evaluatePlayerPosition(playerPosition: Vector3) -> void:
	var distance = global_position.distance_to(position)	
	if distance <= DOOR_OFFSET:
		open()
