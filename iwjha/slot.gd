extends Container
signal Potion_Brewed(type: String)

const _FIRST_FLOWER: int = 0
const _LAST_FLOWER: int = 4
const _FIRST_ROOT: int = 5
const _LAST_ROOT: int = 10
const _FIRST_ANIMAL: int = 11
const _LAST_ANIMAL: int = 15
var currPotion = ""

enum Ingredients{
	Thistle = 0,
	Nightshade = 1,
	Lavender = 2,
	Marigold = 3,
	Juniper_Berries = 4,
	Taproot = 5,
	Cinnamon = 6,
	Brown_Mushroom = 7,
	Red_Mushroom = 8,
	Nirnroot = 9,
	Fire_Salts = 10,
	Chaurus_Egg = 11,
	Ice_Wraith_Teeth = 12,
	Lizard_Tail = 13,
	Eyeballs = 14,
	Fairy_Dust = 15
}

const POTIONS = {
	[Ingredients.Marigold, Ingredients.Brown_Mushroom, Ingredients.Fairy_Dust]: "Health Potion",
	[Ingredients.Marigold, Ingredients.Red_Mushroom, Ingredients.Fairy_Dust]: "Health Potion",
	[Ingredients.Nightshade, Ingredients.Brown_Mushroom, Ingredients.Ice_Wraith_Teeth]: "Poison Potion",
	[Ingredients.Nightshade, Ingredients.Brown_Mushroom, Ingredients.Lizard_Tail]: "Poison Potion",
	[Ingredients.Thistle, Ingredients.Taproot, Ingredients.Chaurus_Egg]: "Alchohol Immunity Potion",
	[Ingredients.Juniper_Berries, Ingredients.Taproot, Ingredients.Chaurus_Egg]: "Alchohol Immunity Potion",
	[Ingredients.Marigold, Ingredients.Fire_Salts, Ingredients.Lizard_Tail]: "Fire Resistance Potion",
	[Ingredients.Lavender, Ingredients.Taproot, Ingredients.Fairy_Dust]: "Romeo/Juliet Potion",	
	[Ingredients.Lavender, Ingredients.Nirnroot, Ingredients.Fairy_Dust]: "Romeo/Juliet Potion",
	[Ingredients.Thistle, Ingredients.Nirnroot, Ingredients.Eyeballs]: "Munster Energy Potion",
	[Ingredients.Thistle, Ingredients.Nirnroot, Ingredients.Chaurus_Egg]: "Munster Energy Potion",
	[Ingredients.Nightshade, Ingredients.Taproot, Ingredients.Eyeballs]: "Stealth Potion",
	[Ingredients.Nightshade, Ingredients.Red_Mushroom, Ingredients.Eyeballs]: "Stealth Potion",
	[Ingredients.Juniper_Berries, Ingredients.Fire_Salts, Ingredients.Ice_Wraith_Teeth]: "All On Red Potion",
	[Ingredients.Lavender, Ingredients.Fire_Salts, Ingredients.Ice_Wraith_Teeth]: "All On Red Potion",
}

var _contents = []

func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	return true
	#return false
	
func _drop_data(_at_position: Vector2, data: Variant) -> void:
	_contents.push_back(data)
	print(_contents)
	
func _process(_delta: float) -> void:
	if _contents.size() == 3:
		currPotion = _brew()
		_contents = []	
		print(currPotion)
	

	
func _brew() -> String:
	_contents.sort()
	if POTIONS.has(_contents):
		Potion_Brewed.emit(POTIONS[_contents])
		return POTIONS[_contents]
	else:
		return _fail()

		
func _fail() -> String:
	return "Fail"
	

#func _isFlower(number: int) -> bool:
	#return number >= _FIRST_FLOWER && number <= _LAST_FLOWER 
	#
#func _isRoot(number: int) -> bool:
	#return number >= _FIRST_ROOT && number <= _LAST_ROOT  
	#
#func _isAnimal(number: int) -> bool:
	#return number >= _FIRST_ANIMAL && number <= _LAST_ANIMAL  
