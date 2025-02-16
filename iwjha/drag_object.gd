extends TextureRect

var id = 0

# Called when the node enters the scene tree for the first time.
func _get_drag_data(at_position: Vector2) -> Variant:
	var prev = TextureRect.new()
	prev.texture = texture
	set_drag_preview(prev)
	
	return id
