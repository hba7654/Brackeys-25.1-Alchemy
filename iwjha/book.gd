extends Node

var _isOpen = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("open_book") and _isOpen:
		_isOpen = false
		$Big.hide()
	elif Input.is_action_just_pressed("open_book") and !_isOpen:
		_isOpen = true
		$Big.show()
		
	if _isOpen:
		if Input.is_action_just_pressed("page_left"):
			pass
		if Input.is_action_just_pressed("page_right"):
			pass
