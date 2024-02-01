@icon("res://Player/Ressources/Equipment/Icons/WeaponIcon.png")
class_name Weapon
extends Equipment

@export_category("Characs")
@export var sprite: Texture2D
@export var type: String
@export var name: String
@export var power: int
@export var knockback: float
@export var price: int
@export_category("Animation")
@export var texture: Texture2D
@export var length: int
