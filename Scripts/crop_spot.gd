extends Node2D

@onready var interaction_area: InteractionArea=$InteractionAre


var rng = RandomNumberGenerator.new()

var spriteState: String="empty"

var plantLevel: int =0

var plantDeathTime: float=10.0

var seconds: float=0.0
var currentTimer: float=0.0

var sprite


func _on_interact():
	if spriteState=="empty":
		var my_random_number = rng.randi_range(1, 4)
		if my_random_number==1:
			spriteState="carrot"
		elif my_random_number==2:
			spriteState="wheat"
		elif my_random_number==3:
			spriteState="cauliflower"
			
		plantLevel=1
		currentTimer= plantDeathTime
		print(my_random_number)
	
	else:
		if currentTimer<=plantDeathTime/1.5 && plantLevel<4:
			plantLevel=plantLevel+1
			
			currentTimer=plantDeathTime
		elif currentTimer<=plantDeathTime/1.5 && plantLevel==4:
			CoinManager.addCoins(10)
			plantLevel=0;
			spriteState="empty"
			

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = $AnimatedSprite2D
	
	sprite.play("empty")
	interaction_area.interact= Callable(self, "_on_interact")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
		seconds=delta;
		
		currentTimer-=seconds
		
		if currentTimer<=0.0:
			spriteState="empty"
			plantLevel=0
			
	
	
		if spriteState=="empty":
			sprite.play(spriteState)
		else:
			sprite.play(spriteState+str(plantLevel))
