extends Node

var _isOpen = false
var _currPage = 0
const _PAGES = {
	0: {"image": "res://Assets/Potions/Potion.png", "Name": "Potion Basics", "Ingredients": "1 Flower\n1 Root/Fungus\n1 Animal Part"},
	1: {"image": "res://Assets/Potions/HealthPotion.png", "Name": "Health Potion", "Ingredients": "1 Marigold\n1 Mushroom\n1 Fairy Dust"},
	2: {"image": "res://Assets/Potions/PoisonPotion.png", "Name": "Poison Potion", "Ingredients": "1 Nightshade\n1 Brown mushroom\n1 Ice Wraith Teeth / 1 Lizard Tail"},
	3: {"image": "res://Assets/Potions/AlcholPotion.png", "Name": "Alchohol Immunity Potion", "Ingredients": "1 Juniper Berries / 1 Thistle\n1 Taproot\n1 Chaurus Egg"},
	4: {"image": "res://Assets/Potions/FireResPotion.png", "Name": "Fire Resistance Potion", "Ingredients": "1 Marigold\n1 Fire Salts\n1 Lizard Tail"},
	5: {"image": "res://Assets/Potions/RomeoPotion.png", "Name": "Romeo/Juliet Potion", "Ingredients": "1 Lavender\n1 Root\n1 Fairy Dust"},
	6: {"image": "res://Assets/Potions/MunsterEnergy.png", "Name": "Munster Energy Potion", "Ingredients": "1 Thistle\n1 Nirnroot\n1 Eyeball / 1 Chaurus Egg"},
	7: {"image": "res://Assets/Potions/StealthPotion.png", "Name": "Stealth Potion", "Ingredients": "1 Nightshade\n1 Taproot / 1 Red Mushroom\n1 Eyeball"},
	8: {"image": "res://Assets/Potions/AllOnRedPotion.png", "Name": "All On Red Potion", "Ingredients": "1 Juniper Berries / Lavender\n1 Fire Salts\n1 Ice Wraith Teeth"},
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
	$PageTurnSound.play()
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
