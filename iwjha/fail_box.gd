extends TextureRect

const _FAILS = ["res://Assets/Explosion.png","res://Assets/FartCloud.png"]

func _on_cauldron_fail() -> void:
	texture = load(_FAILS.pick_random())
	show()
	$showTime.start()


func _on_show_time_timeout() -> void:
	$showTime.stop()
	hide()
