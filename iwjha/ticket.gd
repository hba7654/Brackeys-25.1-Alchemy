class_name Ticket extends TextureRect

var image = null
var label = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	image = $Image
	label = $Label


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
