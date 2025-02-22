extends Node

var _isOpen = false
var _currPage = 0
const _PAGES = {
	0: {"image": "res://Assets/Potions/Potion.png", "Name": "Potion Basics", "Ingredients": "1 Flower, 1 Root/Fungus, 1 Animal Part"},
	1: {"image": "res://Assets/Potions/HealthPotion.png", "Name": "Health Potion", "Ingredients": "1 Marigold, 1 Mushroom, 1 Fairy Dust"},
	2: {"image": "res://Assets/Potions/PoisonPotion.png", "Name": "Poison Potion", "Ingredients": "1 Nightshade, 1 Brown mushroom, 1 Ice Wraith Teeth / 1 Lizard Tail"},
	3: {"image": "", "Name": "Alchohol Immunity Potion", "Ingredients": "1 Juniper Berries / 1 Thistle, 1 Taproot, 1 Chaurus Egg"},
	4: {"image": "", "Name": "Fire Resistance Potion", "Ingredients": "1 Marigold, 1 Fire Salts, 1 Lizard Tail"},
	5: {"image": "", "Name": "Romeo/Juliet Potion", "Ingredients": "1 Lavender, 1 Root, 1 Fairy Dust"},
	6: {"image": "", "Name": "Munster Energy Potion", "Ingredients": "1 Thistle, 1 Nirnroot, 1 Eyeball / 1 Chaurus Egg"},
	7: {"image": "", "Name": "Stealth Potion", "Ingredients": "1 Nightshade, 1 Taproot / 1 Red Mushroom, 1 Eyeball"},
	8: {"image": "", "Name": "All On Red Potion", "Ingredients": "1 Juniper Berries / Lavender, 1 Fire Salts, 1 Ice Wraith Teeth"},
}

var _DISCOVERED = {
	"Potion Basics": {"page": 0, "discovered": true},
	"Health Potion": {"page": 1, "discovered": false},
	"Poison Potion": {"page": 2, "discovered": false},
	"Alchohol Immunity Potion": {"page": 3, "discovered": false},
	"Fire Resistance Potion": {"page": 4, "discovered": false},
	"Romeo/Juliet Potion": {"page": 5, "discovered": false},
	"Munster Energy Potion": {"page": 6, "discovered": false},
	"Stealth Potion": {"page": 7, "discovered": false},
	"All On Red Potion": {"page": 8, "discovered": false},
}

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("open_book") and _isOpen:
		_isOpen = false
		$Big.hide()
	elif Input.is_action_just_pressed("open_book") and !_isOpen:
		_isOpen = true
		_setContent()
		$Big.show()
		
	if _isOpen:
		if Input.is_action_just_pressed("page_left"):
			if _currPage != 0:
				_currPage -= 1
				_setContent()
		if Input.is_action_just_pressed("page_right"):
			if _currPage != 8:
				_currPage += 1
				_setContent()

				
func _setContent() -> void:
	$Big/Name.text = _PAGES[_currPage]["Name"]
	$Big/Image.texture = load(_PAGES[_currPage]["image"])
	if _DISCOVERED[_PAGES[_currPage]["Name"]]["discovered"]:
		$Big/Ingredients.text = _PAGES[_currPage]["Ingredients"]
	else:
		$Big/Ingredients.text = ""
		
	if _currPage != 0:
		$Big/PageLeft.show()
	else:
		$Big/PageLeft.hide()
		
	if _currPage != 8:
		$Big/PageRight.show()
	else:
		$Big/PageRight.hide()

func _on_cauldron_potion_brewed(type: String) -> void:
	if !_DISCOVERED[type]["discovered"]:
		_DISCOVERED[type]["discovered"] = true
