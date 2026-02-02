class_name LightBulb
extends StaticBody3D

@onready var bulbOff: MeshInstance3D = $BulbOff

@onready var bulbGreen: MeshInstance3D = $BulbGreen
@onready var bulbRed: MeshInstance3D = $BulbRed

const TIMEOUT = 0.5

var glowing: bool = false
var showGreen: bool = false
var timer : Timer

func _ready() -> void:
	initTimer()
	turnOff()
	
func initTimer() -> void:
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = TIMEOUT	
	timer.start()
	timer.connect("timeout", onTimerElapsed)			

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

func onTimerElapsed() -> void:	
	glowing = !glowing
	if !glowing:
		print("GLOW...")
		turnOff()
	else:
		print("NO GLOW...")
		if showGreen:
			turnGreen()
		else:
			turnRed()
