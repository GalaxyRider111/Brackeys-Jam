extends Node2D

@onready var label=$Label
@onready var player=get_tree().get_first_node_in_group("player")
var seconds: float =0



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player=get_tree().get_first_node_in_group("player")
	seconds+=delta
	GlobalTimer.setGlobalTimer(int(seconds))
	
	if int(seconds)%50==0:
		player.Vampirism(10)
	
	label.text="Time survived: "+str(int(seconds))
	
	if seconds >=300:
		get_tree().change_scene_to_file("res://Scenes/victory.tscn")
