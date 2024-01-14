extends AnimationPlayer

@export var length : int
@export var texture : Texture2D

# Called when the node enters the scene tree for the first time.
func _ready():
	get_animation("GroundAttack").length = length
	get_animation("GroundAttack").track_insert_key(0, 0, texture)
	get_animation("GroundAttack").track_insert_key(1, 0, length)
	for f in length:
		get_animation("GroundAttack").track_insert_key(2, f, f, 1)
	
