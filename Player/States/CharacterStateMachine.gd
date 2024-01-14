class_name StateMachine
extends Node


@export var current_state : State
var previous_state : State

@export var can_transition : bool = true

func _ready():
	previous_state = current_state
	current_state.enter()


func change_state(state):
	if current_state.name != state:
		
		previous_state.exit()

		current_state = find_child(state) as State
		current_state.enter()
		
		previous_state = current_state
