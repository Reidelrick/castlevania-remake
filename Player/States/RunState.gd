extends State
class_name RunState

#@export var anim_tree : AnimationTree

func transition():
	if fsm.can_transition:
		if Input.is_action_just_pressed("attack"):
				fsm.change_state("GroundAttackState")
		elif Input.is_action_just_pressed("down"):
			fsm.change_state("CrouchState")
		elif owner.velocity.y < 0:
			fsm.change_state("JumpState")
		elif owner.velocity.y > 0:
			fsm.change_state("IdleState")
		elif owner.direction == 0:
			fsm.change_state("IdleState")

func enter():
	super.enter()
	owner.velocity.x = owner.direction * owner.speed
	%AnimationTree.set("parameters/Movement/transition_request", "Run")

func exit():
	super.exit()

func _physics_process(delta):
	super._physics_process(delta)
	if Input.is_action_just_pressed("jump"):
		owner.velocity.y = owner.jump_force
