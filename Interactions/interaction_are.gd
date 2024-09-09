extends Area2D
class_name InteractionArea



@export var action_name: String ="interact"

var manager= InstanceManager.new()

var interact: Callable = func():
	pass
	
	


func _on_body_entered(body):
	manager.register_area(self)
	
	



func _on_body_exited(body: Node2D) -> void:
	manager.unregister_area(self)
