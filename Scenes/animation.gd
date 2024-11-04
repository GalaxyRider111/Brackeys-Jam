extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("skip"):
		get_tree().change_scene_to_file("res://Scenes/Game.tscn")
		CoinManager.setGameState(1)


func _on_video_stream_player_finished() -> void:
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")
	CoinManager.setGameState(1)
