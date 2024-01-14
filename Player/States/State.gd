class_name State
extends Node

@onready var fsm = get_parent() as StateMachine

func _ready():
	print("ready:",name)
	set_physics_process(false)

func enter() -> void:
	print("enter:",name)
	set_physics_process(true)
	
func exit() -> void:
	print("exit:",name)
	set_physics_process(false)

func transition():
	pass

func _physics_process(_delta):
	transition()

