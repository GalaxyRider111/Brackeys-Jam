extends Node2D



@onready var player =get_tree().get_first_node_in_group("player")
@onready var label=$Label

const base_text=""

var active_area =[]
var can_Interact= true

func register_area(area: InteractionArea):
	active_area.push_back(area)
	
func unregister_area(area: InteractionArea):
	var index = active_area.find(area)
	if index !=-1:
		active_area.remove_at(index)
		
		
		
func _process(delta):
	player =get_tree().get_first_node_in_group("player")
	if active_area.size() >0 && can_Interact:
		active_area.sort_custom(_sort_to_distance_player)
		label.text= base_text+ active_area[0].action_name
		label.global_position=active_area[0].global_position
		label.global_position.y-=36
		label.global_position.x -= label.size.x/2
		label.show()
	else:
		label.hide()
		
		
		
	
	
func _sort_to_distance_player(area1, area2):
	var area1_to_player= player.global_position.distance_to(area1.global_position)
	var area2_to_player= player.global_position.distance_to(area2.global_position)
	
	return area1_to_player < area2_to_player
	
func _input(event):
		if event.is_action_pressed("interact"):
			if active_area.size()>0 :
				can_Interact=false
				label.hide()
				
				await active_area[0].interact.call()
				
				can_Interact =true
			
