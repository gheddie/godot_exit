extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func onBodyEntered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body is Player:
		LevelProviderInstance.levelFinished()
