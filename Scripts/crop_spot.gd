extends Node2D

var interaction_area= InteractionArea.new()

var sprite


func _on_interact():
	sprite.play("carrot")

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = $AnimatedSprite2D
	interaction_area=$InteractionAre
	sprite.play("empty")
	interaction_area.interact= Callable(self, "_on_interact")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
