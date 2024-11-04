extends Node

@onready var totalCoins: int=0

var gameState

func  returnCoins() -> int :
	return totalCoins
	
func addCoins(newCoins: int):
	totalCoins=totalCoins+ newCoins

func setGameState( newState):
	gameState=newState

func returnGameState():
	return gameState
	
