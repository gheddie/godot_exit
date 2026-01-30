class_name TreeUtil
extends Object

static func mapSceneObjects(root, map) -> Dictionary:
	var children = root.get_children()
	for child in children:
		if child is MeshInstance3D:
			# print(child.name)
			map.set(child.name, child)
		mapSceneObjects(child, map)
	return map
