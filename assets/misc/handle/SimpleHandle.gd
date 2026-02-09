class_name Handle
extends StaticBody3D

@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
@onready var bulb: MeshInstance3D = $Frame/Bulb

var red: StandardMaterial3D
var green: StandardMaterial3D
var pulled: bool = false

@export var door: HandledWallDoor

func _ready() -> void:
	initMaterials()
	glowRed()
	
func initMaterials() -> void:
	# red
	red = StandardMaterial3D.new()
	red.albedo_color = Color.RED
	# green
	green = StandardMaterial3D.new()
	green.albedo_color = Color.GREEN

func onBodyEntered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if !pulled:
		if body is Player:
			if !animationPlayer.is_playing():
				animationPlayer.play("PullHandleDown")
				
func onBodyExited(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body is Player:
		if animationPlayer.is_playing():
			animationPlayer.play_backwards("PullHandleDown")

func onHandlePulled() -> void:
	glowGreen()
	pulled = true
	door.open()

func glowRed() -> void:
	bulb.material_override = red
	
func glowGreen() -> void:
	bulb.material_override = green
