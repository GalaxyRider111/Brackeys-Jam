extends CharacterBody2D


const speed = 100
var damage
var current_dir="none"
var health=100
var attack=20
var playerAlive=true
var enemyAttackRange=false

var previousMovement

@onready var hurtCooldownTimer=$HurtCooldown
@onready var waterTimer=$WaterAnim

var isWatering=false

var hurtCooldown=false

var isAttacking= false

var movementAnimation: int
@onready var AttackAnimTimer=$AttackAnim

@onready var healthBar=$HealthBar




func _physics_process(delta: float) -> void:
	
	match CoinManager.returnGameState():
		1:
			healthBar.hide()
		2:
			healthBar.show()
	
	player_movement(delta)
	
	
func player_movement(delta):
	
	#healthBar.global_position.x= global_position.x
	#healthBar.global_position.y= global_position.y+ 3
	

	if Input.is_action_pressed("go_up"):
	
		current_dir="back"
		if not (isAttacking || isWatering):
			movementAnimation=1
		velocity.x=0
		velocity.y=-speed
	elif Input.is_action_pressed("go_right"):
		current_dir="right"
		if not (isAttacking || isWatering):
			movementAnimation=1
		velocity.x=speed
		velocity.y=0
	elif Input.is_action_pressed("go_left"):
		current_dir="left"
		if not (isAttacking || isWatering):
			movementAnimation=1
		velocity.x=-speed
		velocity.y=0
	elif Input.is_action_pressed("go_down"):
		current_dir="front"
		if not (isAttacking || isWatering):
			movementAnimation=1
		velocity.x=-0
		velocity.y=speed
		
	else:
		if not isAttacking:
			movementAnimation=0
		velocity.x=0
		velocity.y=0
	
	Movement_Animations(movementAnimation)
	updateHealth()
	playerDeath()
	HitEnemy()


	move_and_slide()
	
func Movement_Animations(movement): 
	var orientation= current_dir
	var anim=$AnimatedSprite2D
	
	if orientation =="right":
		anim.flip_h=false;
		if movement ==0:
			anim.play("side_idle")
		elif movement==1:
			anim.play("side_walk")
		elif movement==2:
			anim.play("side_attack")
		elif movement==3:
			anim.play("side_gardening")
			
	elif orientation =="left":
		anim.flip_h=true;
		if movement ==0:
			anim.play("side_idle")
		elif movement==1:
			anim.play("side_walk")
		elif movement==2:
			anim.play("side_attack")
		elif movement==3:
			anim.play("side_gardening")
			
	elif orientation =="front":
		anim.flip_h=false;
		if movement ==0:
			anim.play("front_idle")
		elif movement==1:
			anim.play("front_walk")
		elif movement==2:
			anim.play("front_attack")
		elif movement==3:
			anim.play("side_gardening")
			
	elif orientation =="back":
		anim.flip_h=false;
		if movement ==0:
			anim.play("back_idle")
		elif movement==1:
			anim.play("back_walk")
		elif movement==2:
			anim.play("back_attack")
		elif movement==3:
			anim.play("side_gardening")
	
 
func updateHealth():
	healthBar.value=health
	
func Vampirism(newHealth):
	health+=newHealth
	

func get_hit():
	if Input.is_action_pressed("attack"):
		print("WORK")
		previousMovement=movementAnimation
		movementAnimation=2
		isAttacking=true
		AttackAnimTimer.start()
		
		return true
	else:
		return false


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("enemy"):
		enemyAttackRange=true


func _on_hitbox_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_hurt_box_hurt(damage: Variant) -> void:
	if not hurtCooldown:
		hurtCooldown=true
		hurtCooldownTimer.start()
		
		health-=damage
		print(health)
	
func waterPlants():
	previousMovement=movementAnimation
	isWatering=true
	movementAnimation=3
	waterTimer.start()


func _on_hurt_cooldown_timeout() -> void:
		hurtCooldown=false;


func _on_attack_anim_timeout() -> void:
	movementAnimation=previousMovement
	isAttacking=false

func playerDeath():
	if health<=0:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
		
		
		

var active_body =[]
var can_Hit= true


func _on_hurt_area_body_entered(body: Node2D) -> void:
	if body.has_method("GetHit"):
		active_body.push_back(body)


func _on_hurt_area_body_exited(body: Node2D) -> void:
	var index = active_body.find(body)
	if index !=-1:
		active_body.remove_at(index)
		
func HitEnemy():
	if Input.is_action_just_pressed("attack"):
		previousMovement=movementAnimation
		movementAnimation=2
		isAttacking=true
		AttackAnimTimer.start()
		for i in active_body:
			i.GetHit()


func _on_water_anim_timeout() -> void:
	movementAnimation=previousMovement
	isWatering=false
