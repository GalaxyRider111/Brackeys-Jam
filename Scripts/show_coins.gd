extends Node2D

@onready var label=$Label



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var coins: int= CoinManager.returnCoins()
	label.text="Ingredients: "+str(coins)
