extends TextureRect

const _FAILS = ["res://Assets/Explosion.png","res://Assets/FartCloud.png"]

func _on_cauldron_fail() -> void:
	var fail_int = randi() % 2
	if fail_int == 0:
		texture = load("res://Assets/Explosion.png")
		$ExplodeSound.play()
	else:
		texture = load("res://Assets/FartCloud.png")
		$FartSound.play()
	
	$showTime.start()
	show()
	


func _on_show_time_timeout() -> void:
	$showTime.stop()
	hide()
