extends Node

@onready var totalCoins: int=0

func  returnCoins() -> int :
	return totalCoins
	
func addCoins(newCoins: int):
	totalCoins=totalCoins+ newCoins
