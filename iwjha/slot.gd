extends Container

const _FIRST_FLOWER: int = 0
const _LAST_FLOWER: int = 4
const _FIRST_ROOT: int = 5
const _LAST_ROOT: int = 9
const _FIRST_ANIMAL: int = 10
const _LAST_ANIMAL: int = 14
var currPotion = ""

enum Ingredients{
	Thistle = 0,
	Nightshade = 1,
	Lavender = 2,
	Marigold = 3,
	Bumblebee = 4,
	Eyeballs = 5,
	Brown_Mushroom = 6,
	Red_Mushroom = 7,
	Heart = 8,
	Moth_Wings = 9,
	Chaurus_Egg = 10,
	Dragon_Egg = 11,
	Slime_Egg = 12,
	Ice_Teeth = 13
}

var potions = {
	[3,6,13]: "Health Potion",
	[3,7,13]: "Health Potion"
}

var _contents = []

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true
	return false
	
func _drop_data(at_position: Vector2, data: Variant) -> void:
	_contents.push_back(data)
	print(_contents)
	
func _process(delta: float) -> void:
	if _contents.size() == 3:
		currPotion = _brew()
		_contents = []	
		print(currPotion)
	

	
func _brew() -> String:
	_contents.sort()
	return potions[_contents] if potions.has(_contents) else _fail()

		
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
