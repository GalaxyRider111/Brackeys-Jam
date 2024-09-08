extends CharacterBody2D


const speed = 100
var current_dir="none"



func _physics_process(delta: float) -> void:
	player_movement(delta)
	
	
func player_movement(delta):

	if Input.is_action_pressed("ui_up"):
	
		current_dir="back"
		Movement_Animations(1)
		velocity.x=0
		velocity.y=-speed
	elif Input.is_action_pressed("ui_right"):
		current_dir="right"
		Movement_Animations(1)
		velocity.x=speed
		velocity.y=0
	elif Input.is_action_pressed("ui_left"):
		current_dir="left"
		Movement_Animations(1)
		velocity.x=-speed
		velocity.y=0
	elif Input.is_action_pressed("ui_down"):
		current_dir="front"
		Movement_Animations(1)
		velocity.x=-0
		velocity.y=speed
		
	else:
		
		Movement_Animations(0)
		velocity.x=0
		velocity.y=0
		

	
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
			
	elif orientation =="left":
		anim.flip_h=true;
		if movement ==0:
			anim.play("side_idle")
		elif movement==1:
			anim.play("side_walk")
			
	elif orientation =="front":
		anim.flip_h=false;
		if movement ==0:
			anim.play("front_idle")
		elif movement==1:
			anim.play("front_walk")
			
	elif orientation =="back":
		anim.flip_h=false;
		if movement ==0:
			anim.play("back_idle")
		elif movement==1:
			anim.play("back_walk")
