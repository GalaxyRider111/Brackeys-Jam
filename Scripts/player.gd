extends CharacterBody2D


const speed = 100
var current_dir="none"
var health=100
var attack=20
var playerAlive=true
var enemyAttackRange=false

var previousMovement

@onready var hurtCooldownTimer=$HurtCooldown
var hurtCooldown=false

var isAttacking= false

var movementAnimation: int
@onready var AttackAnimTimer=$AttackAnim


func _physics_process(delta: float) -> void:
	player_movement(delta)
	
	
func player_movement(delta):

	if Input.is_action_pressed("ui_up"):
	
		current_dir="back"
		if not isAttacking:
			movementAnimation=1
		velocity.x=0
		velocity.y=-speed
	elif Input.is_action_pressed("ui_right"):
		current_dir="right"
		if not isAttacking:
			movementAnimation=1
		velocity.x=speed
		velocity.y=0
	elif Input.is_action_pressed("ui_left"):
		current_dir="left"
		if not isAttacking:
			movementAnimation=1
		velocity.x=-speed
		velocity.y=0
	elif Input.is_action_pressed("ui_down"):
		current_dir="front"
		if not isAttacking:
			movementAnimation=1
		velocity.x=-0
		velocity.y=speed
		
	else:
		if not isAttacking:
			movementAnimation=0
		velocity.x=0
		velocity.y=0
	
	Movement_Animations(movementAnimation)

	
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
			
	elif orientation =="left":
		anim.flip_h=true;
		if movement ==0:
			anim.play("side_idle")
		elif movement==1:
			anim.play("side_walk")
		elif movement==2:
			anim.play("side_attack")
			
	elif orientation =="front":
		anim.flip_h=false;
		if movement ==0:
			anim.play("front_idle")
		elif movement==1:
			anim.play("front_walk")
		elif movement==2:
			anim.play("front_attack")
			
	elif orientation =="back":
		anim.flip_h=false;
		if movement ==0:
			anim.play("back_idle")
		elif movement==1:
			anim.play("back_walk")
		elif movement==2:
			anim.play("back_attack")
	
 
func get_hit():
	if Input.is_action_pressed("attack"):
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
	


func _on_hurt_cooldown_timeout() -> void:
		hurtCooldown=false;


func _on_attack_anim_timeout() -> void:
	movementAnimation=previousMovement
	isAttacking=false
