extends Node2D

var globalTimer: int=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func setGlobalTimer( seconds: int):
	globalTimer=seconds

func getGlobalTimer():
	return globalTimer
