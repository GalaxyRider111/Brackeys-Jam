extends Node2D
class_name GameObj

var player: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	 
	player = get_node("Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player = get_node("Player")
	pass

func  return_Player() -> Node2D:
	return player
