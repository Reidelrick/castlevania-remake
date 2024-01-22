extends Label
class_name RoomName

@export var fade: bool

func display_map(map):
	text = (map.capitalize()).get_slice(".", 0)
	if fade:
		create_tween().tween_property(self, "modulate", Color(1, 1, 1, 0), 2)
		await get_tree().create_timer(2).timeout
		queue_free()
