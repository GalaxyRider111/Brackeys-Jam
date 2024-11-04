extends Control

@onready var label=$Label2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_replay_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")
	CoinManager.setGameState(1)


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	CoinManager.setGameState(0)
