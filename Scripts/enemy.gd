extends CharacterBody2D

var speed=20
var acc=1
var player_chase=false
var player=null


@onready var playerr= get_tree().get_first_node_in_group("player")

@onready var sprite=$AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
		
	player_chase=true
	if player_chase:
		#position +=(player.position - position)/speed
		var direction=  self.global_position.direction_to(playerr.global_position)
		
		velocity= direction* speed
		
		sprite.play("walk")
		
	#	if player.position.x -position.x <0:
		#	sprite.flip_h=true
		#else:
		#	sprite.flip_h=false
	else:
		velocity=Vector2.ZERO
		sprite.play("idle")
		
	move_and_slide()


func _on_trigger_area_body_entered(body) -> void:
	player_chase=true
	player=body


func _on_trigger_area_body_exited(body) -> void:
	player_chase=false
	player=null
	
func enemy():
	pass
