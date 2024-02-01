extends CharacterBody2D

var direction : int
@export var speed : int = 300
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var reset_position: Vector2

var jump_force = -490

func _ready():
	%AnimationTree.active = true

func _physics_process(_delta):
	direction = round(Input.get_axis(
			"left",
			"right"
		))
	if direction > 0:
		%Sprite.flip_h = false
	elif direction < 0:
		%Sprite.flip_h = true
	velocity.x = direction * speed
	
	if not is_on_floor():
		velocity.y += gravity

	move_and_slide()

	%AnimationPlayer.update_anim(PlayerStats.weapon.length, PlayerStats.weapon.texture)

func on_enter():
	# Position for kill system. Assigned when entering new room (see Game.gd).
	reset_position = position
