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
	"Health Potion",
	"Poison Potion",
	"Alchohol Immunity Potion",
	"Fire Resistance Potion",
	"Romeo/Juliet Potion",
	"Munster Energy Potion",
	"Stealth Potion",
	"All On Red Potion"
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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_request_timer_timeout() -> void:
	for n in range(4):
		if requests[n] == "":
			var type = randi() % requests.size()
			requests[n] = _POTION_TYPES[type]
			tickets[n].image.texture = load(_POTION_IMAGES[type])
			tickets[n].label.text = _POTION_TYPES[type]
			tickets[n].show()
			print(requests)
			return
	# If the slots are full stop the timer
	$RequestTimer.stop()


func _on_cauldron_potion_brewed(type: String) -> void:
	if requests.has(type):
		for n in range(4):
			if requests[n] == type:
				requests[n] = ""
				tickets[n].hide()
				if $RequestTimer.is_stopped():
					$RequestTimer.start()
				break
