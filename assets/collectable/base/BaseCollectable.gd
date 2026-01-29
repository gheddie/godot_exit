@abstract
class_name BaseCollectable
extends StaticBody3D

const COLLECTABLE_OFFSET = 5.0

func acceptPlayerPosition(_position: Vector3) -> void:
	var relativeAngle = GeometryUtil.getRelativeAngle(global_position, _position)
	# print(str("relativeAngle --> ", str(relativeAngle)))
	var distance = global_position.distance_to(_position)
	if distance <= COLLECTABLE_OFFSET:
		harvestingFinished()

func harvestingFinished() -> void:
	# queue_free()
	pass

func evaluatePlayerPosition(playerPosition: Vector3) -> void:
	queue_free()
