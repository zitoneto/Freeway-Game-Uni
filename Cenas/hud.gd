extends CanvasLayer

signal reinicia

func _on_button_pressed() -> void:
	emit_signal("reinicia");
	get_tree().change_scene_to_file("res://Cenas/main.tscn")
