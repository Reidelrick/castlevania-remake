# The window that contains a bigger map overview than minimap. Toggled with M.
extends Panel

# The size of the window in cells.
var SIZE: Vector2i

# The position where the player started (for the vector feature).
var starting_coords: Vector2i
# The offset for drawing the cells. Allows map panning.
var offset: Vector2i
# The player location node from MetSys.add_player_location()
var player_location: Node2D

func _ready() -> void:
	# Cellular size is total size divided by cell size.
	SIZE = size / MetSys.CELL_SIZE
	# Connect some signals.
	MetSys.cell_changed.connect(queue_redraw.unbind(1))
	MetSys.cell_changed.connect(update_offset.unbind(1)) # When player moves to another cell, move the map.
	MetSys.map_updated.connect(queue_redraw)
	# Create player location. We need a reference to update its offset.
	player_location = MetSys.add_player_location(self)

func _draw() -> void:
	for x in SIZE.x:
		for y in SIZE.y:
			# Draw cells. Note how offset is used.
			MetSys.draw_cell(self, Vector2i(x, y), Vector3i(x - offset.x, y - offset.y, MetSys.current_layer))
	# Draw shared borders and custom elements.
	if MetSys.settings.theme.use_shared_borders:
		MetSys.draw_shared_borders()
	MetSys.draw_custom_elements(self, Rect2i(-offset.x, -offset.y, SIZE.x, SIZE.y))
	# Get the current player coordinates.
	var coords := MetSys.get_current_flat_coords()

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed:
			# Toggle visibility when pressing M.
			if event.keycode == KEY_M:
				visible = not visible
				if visible:
					update_offset()

func update_offset():
	# Update the map offset based on the current position.
	# Normally the offset is interactive and the player is able to move freely around the map.
	# But in this demo, the map can overlay the game and thus is updated in real time.
	offset = -MetSys.get_current_flat_coords() + SIZE / 2
	player_location.offset = Vector2(offset) * MetSys.CELL_SIZE

func reset_starting_coords():
	# Starting position for the delta vector.
	var coords := MetSys.get_current_flat_coords()
	starting_coords = Vector2i(coords.x, coords.y)
	queue_redraw()
