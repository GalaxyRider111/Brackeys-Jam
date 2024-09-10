class_name InteractionArea extends Node2D



@export var action_name: String ="interact"


var interact: Callable = func():
	pass
	
	


func _on_body_entered(body):
	InteractionManager.register_area(self);
	
	



func _on_body_exited(body):
	InteractionManager.unregister_area(self);
