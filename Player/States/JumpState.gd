extends State
class_name JumpState

#@export var anim_tree : AnimationTree

func transition():
	if fsm.can_transition:
		if owner.velocity.y > 0:
			fsm.change_state("FallState")
		elif owner.is_on_floor():
			if owner.direction == 0:
				fsm.change_state("IdleState")
			elif owner.direction != 0:
				fsm.change_state("RunState")

func enter():
	super.enter()
	%AnimationTree.set("parameters/Air/blend_position", sign(owner.velocity.y))
	%AnimationTree.set("parameters/Movement/transition_request", "Air")
	

func _physics_process(delta):
	super._physics_process(delta)