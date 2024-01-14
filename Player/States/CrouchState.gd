extends State
class_name CrouchState

func transition():
	if Input.is_action_just_released("down"):
		fsm.change_state("IdleState")

func enter():
	super.enter()
	owner.direction = 0
	%AnimationTree.set("parameters/Movement/transition_request", "Crouch")
	

func _physics_process(delta):
	super._physics_process(delta)
