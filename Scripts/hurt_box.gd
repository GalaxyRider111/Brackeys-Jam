extends Area2D

@export_enum("Cooldown", "HitOnce","DisableHitBox") var HurtBoxType=0


@onready var collision=$CollisionShape2D

@onready var disableTimer=$DisableTimer

signal hurt(damage)
	
	



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision=$CollisionShape2D
	disableTimer=$DisableTimer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	print("hope")
	if area.is_in_group("attack"):
		print("HOPE")
		if not area.get("damage")==null:
			print("Cmonsssss")
			
			match HurtBoxType:
				0: #Cooldown
					collision.call_deferred("set","disabled", true)
					disableTimer.start()
				1: #HitOnce
					pass
					
				2: #DissabledHitBox
					if area.has_method("tempDisabled"):
						area.tempDisabled()
			
			var damage= area.damage
			emit_signal("hurt", damage)

func _on_disable_timer_timeout() -> void:
	collision.call_deferred("set","disabled", false)
