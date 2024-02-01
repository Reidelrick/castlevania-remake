extends Enemy
class_name GroundedEnemy

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	#super._physics_process(delta)
	if not is_on_floor():
		velocity.y += gravity
	
