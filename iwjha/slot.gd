extends TextureRect

var contents = []


# Called when the node enters the scene tree for the first time.
func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true
	return false
	
func _drop_data(at_position: Vector2, data: Variant) -> void:
	contents.push_back(data)
	print(contents)
