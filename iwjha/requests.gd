extends Node

const _POTION_TYPES = [
	"Health Potion",
	"Poison Potion",
	"Alchohol Immunity Potion",
	"Fire Resistance Potion",
	"Romeo/Juliet Potion",
	"Munster Energy Potion",
	"Stealth Potion",
	"All On Red Potion"
	]
	
const _POTION_IMAGES = [
	"res://Assets/Potions/HealthPotion.png",
	"res://Assets/Potions/PoisonPotion.png",
	"res://Assets/Potions/AlcholPotion.png",
	"res://Assets/Potions/FireResPotion.png",
	"res://Assets/Potions/RomeoPotion.png",
	"res://Assets/Potions/MunsterEnergy.png",
	"res://Assets/Potions/StealthPotion.png",
	"res://Assets/Potions/AllOnRedPotion.png"
	]

var requests = ["","","",""]
var tickets = [null,null,null,null]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var children = get_children()
	var i = 0
	for child in children:
		if child is Ticket:
			tickets[i] = child
			i += 1

func _on_request_timer_timeout() -> void:
	for n in range(4):
		if requests[n] == "":
			var type = randi() % requests.size()
			requests[n] = _POTION_TYPES[type]
			tickets[n].image.texture = load(_POTION_IMAGES[type])
			tickets[n].label.text = _POTION_TYPES[type]
			tickets[n].show()
			$RequestSound.play()
			print(requests)
			return
	# If the slots are full stop the timer
	$RequestTimer.stop()


func _on_cauldron_potion_brewed(type: String) -> void:
	if requests.has(type):
		for n in range(4):
			if requests[n] == type:
				requests[n] = ""
				$SuccessSound.play()
				tickets[n].hide()
				if $RequestTimer.is_stopped():
					$RequestTimer.start()
				break
