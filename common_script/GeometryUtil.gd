class_name GeometryUtil
extends Object

static func getRelativeAngle(pos1:Vector3, pos2:Vector3) -> float:
	return rad_to_deg(pos1.angle_to(pos2))
