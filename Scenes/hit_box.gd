extends Area2D

@export var damage=1

@onready var collision=$CollisionShape2D
@onready var disableTimer=$DisableHitBoxTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func tempDisabled():
	collision.call_deferred("set","disabled",true)
