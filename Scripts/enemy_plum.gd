extends CharacterBody2D

var speed=32
var acc=1
var player_chase=false
var player=null

var health=100
var attack=5


@onready var playerr= get_tree().get_first_node_in_group("player")

@onready var sprite=$AnimatedSprite2D

@onready var healthBar=$HealthBar
@onready var hitTimer=$HitTimer

var rotationOffset=0
var rotatingDirection=1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	playerr= get_tree().get_first_node_in_group("player")
		
	player_chase=true
	if player_chase:
		#position +=(player.position - position)/speed
		var direction=  self.global_position.direction_to(playerr.global_position)
		
		velocity= direction* speed
		
		sprite.play("walk")
		
		global_rotation_degrees=rotationOffset
		rotationOffset+= rotatingDirection
		
		if rotationOffset==7 || rotationOffset==-7:
			rotatingDirection*=-1
		
		
		if playerr.position.x -position.x <0:
			sprite.flip_h=false
		else:
			sprite.flip_h=true
	else:
		velocity=Vector2.ZERO
		sprite.play("idle")
		sprite.rotation_degrees(0)
		
	move_and_slide()
	updateHealthBar()


func updateHealthBar():
	healthBar.value=health

func _on_trigger_area_body_entered(body) -> void:
	player_chase=true
	player=body


func _on_trigger_area_body_exited(body) -> void:
	player_chase=false
	player=null
	
func enemy():
	pass



func GetHit():
	print("SOMEHOW")
	
	modulate=Color(0,0,0)
	hitTimer.start()
	print("HIT")
	health-=30
	
	#health-=damage
	if health <=0:
		queue_free()
		#playerr.Vampirism(3)



func _on_hit_timer_timeout() -> void:
	modulate=Color(1,1,1)
