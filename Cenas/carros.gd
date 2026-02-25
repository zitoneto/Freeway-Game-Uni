extends RigidBody2D


func _ready() -> void:
	var tipos_carros = $Animated.sprite_frames.get_animation_names();
	var carros = tipos_carros[randi_range(0, tipos_carros.size() - 1)]
	$Animated.animation = carros;


func _on_notifier_screen_exited() -> void:
	queue_free();
