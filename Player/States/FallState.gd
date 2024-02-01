extends State
class_name FallState

func transition():
	if owner.is_on_floor():
		if Input.is_action_just_pressed("attack"):
			fsm.change_state("AirAttackState")
		elif owner.direction == 0:
			fsm.change_state("IdleState")
		elif owner.direction != 0:
			fsm.change_state("RunState")
	elif owner.velocity.y < 0:
		fsm.change_state("JumpState")

func enter():
	super.enter()
	%AnimationTree.set("parameters/Air/blend_position", sign(owner.velocity.y))
	%AnimationTree.set("parameters/Movement/transition_request", "Air")

func _physics_process(delta):
	super._physics_process(delta)
