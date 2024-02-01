extends CharacterBody2D
class_name Enemy

@export var hp: int
@export var contact_damage: int

func take_damage(damage: int):
	hp -= damage
	if hp <= 0:
		die()

func die():
	pass
