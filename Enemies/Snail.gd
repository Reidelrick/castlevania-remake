extends GroundedEnemy

@export var speed : int
var stopped: bool = false

var side:int = 1

func _physics_process(delta):
	super._physics_process(delta)
	if side == 1:
		$Sprite.flip_h = true
		$PlayerDetect/CollisionPolygon2D.scale.x = -1
	elif side == -1:
		$Sprite.flip_h = false
		$PlayerDetect/CollisionPolygon2D.scale.x = 1

	if $WallDetect.is_colliding() and not stopped:
		#take_damage(999)
		side = -side
	elif not $GapDetect.is_colliding() and not stopped:
		side = -side
		
	$WallDetect.target_position.x = 16*side
	$GapDetect.position.x = 16*side


	if not stopped:
		velocity.x = speed*side
		move_and_slide()


func _on_player_entered(body):
	if body.name == "Player":
		$AnimationPlayer.play("Hide")
		stopped = true


func _on_player_exited(body):
	if body.name == "Player":
		$AnimationPlayer.play_backwards("Hide")
		await $AnimationPlayer.animation_finished
		stopped = false
		$AnimationPlayer.play("Walk")

func die():
	super.die()
	stopped = true
	$AnimationPlayer.play("Death")
	await $AnimationPlayer.animation_finished
	queue_free()
