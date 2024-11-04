extends Node2D

@onready var interaction_area: InteractionArea=$InteractionAre

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact= Callable(self, "_on_interact")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_interact():
	if CoinManager.returnCoins()>=100:
		get_tree().change_scene_to_file("res://Scenes/lighting_strike.tscn")
		CoinManager.setGameState(2)
