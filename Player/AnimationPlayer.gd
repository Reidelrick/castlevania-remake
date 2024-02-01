extends AnimationPlayer

func update_anim(new_length: int, new_texture: Texture2D):
	get_animation("GroundAttack").length = new_length/10.0
	get_animation("GroundAttack").track_insert_key(0, 0, new_texture)
	get_animation("GroundAttack").track_insert_key(1, 0, new_length)
	for f in new_length:
		get_animation("GroundAttack").track_insert_key(2, f/10.0, f, 1)
