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

var requests = ["","","",""]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_request_timer_timeout() -> void:
	for n in range(4):
		if requests[n] == "":
			requests[n] = _POTION_TYPES.pick_random()
			print(requests)
			return
	# If the slots are full stop the timer
	$RequestTimer.stop()


func _on_cauldron_potion_brewed(type: String) -> void:
	if requests.has(type):
		for n in range(4):
			if requests[n] == type:
				requests[n] = ""
				break
