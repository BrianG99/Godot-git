class_name perro
extends CharacterBody2D

@export var move_speed : float
@export var jump_speed: float
@onready var animated_sprite = $Sprite2D
var is_facing_right = true
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	jump(delta)
	move_x()
	flip()
	animation()
	move_and_slide()
	
func animation():
	if velocity.x:
		animated_sprite.play("caminar")
	else:
		animated_sprite.play("reposo")

	if not is_on_floor():
		if velocity.y < 0:
			animated_sprite.play("salto")
		else:
			animated_sprite.play("caida")
		return
		
	
func jump(delta):
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = -jump_speed
		if not is_on_floor():
			velocity.y += gravity * delta
	
func move_x():
	var input_axis = Input.get_axis("move_left", "move_right")
	velocity.x = input_axis * move_speed 
	
func flip():
	if (is_facing_right and velocity.x <0) or (not is_facing_right and velocity.x >0):	
		scale.x *= -1
		is_facing_right = not is_facing_right
	
