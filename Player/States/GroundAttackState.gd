extends State
class_name GroundAttackState

func transition():
	if fsm.can_transition:
		fsm.change_state("IdleState")

func enter():
	super.enter()
	fsm.can_transition = false
	%AnimationTree.set("parameters/AttackMode/transition_request", "Ground")
	#%AnimationTree.set("parameters/GroundAttacks/transition_request", PlayerStats.weapon.type + "GroundAttack")
	%AnimationTree.set("parameters/Attack/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	await %AnimationTree.animation_finished
	fsm.can_transition = true

func exit():
	super.exit()

func _physics_process(delta):
	super._physics_process(delta)
