extends Area2D

@export var damage=1

@onready var collision=$CollisionShape2D
@onready var disableTimer=$DisableHitBoxTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision=$CollisionShape2D
	disableTimer=$DisableHitBoxTimer



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func tempDisabled():
	collision.call_deferred("set","disabled",true)
	disableTimer.start()


func _on_disable_hit_box_timer_timeout() -> void:
		collision.call_deferred("set","disabled",false)
