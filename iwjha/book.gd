extends Node

var _isOpen = false
var _currPage = 1
const PAGES = {
	1: {"image": "", "Name": "Health Potion", "Ingredients": ""},
	2: {"image": "", "Name": "Poison Potion", "Ingredients": ""},
	3: {"image": "", "Name": "Alchohol Immunity Potion", "Ingredients": ""},
	4: {"image": "", "Name": "Fire Resistance Potion", "Ingredients": ""},
	5: {"image": "", "Name": "Romeo/Juliet Potion", "Ingredients": ""},
	6: {"image": "", "Name": "Munster Energy Potion", "Ingredients": ""},
	7: {"image": "", "Name": "Stealth Potion", "Ingredients": ""},
	8: {"image": "", "Name": "All On Red Potion", "Ingredients": ""},
}

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
			if _currPage != 1:
				_currPage -= 1
		if Input.is_action_just_pressed("page_right"):
			if _currPage != 8:
				_currPage += 1
