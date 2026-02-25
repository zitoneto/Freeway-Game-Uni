extends Node

var cenaCarros = preload("res://Cenas/carros.tscn")
var score = 0
var pistas_rapidas_y = [104, 272, 488]
var pistas_lentas_y = [160, 216, 324, 384, 438, 544, 600]

func _ready() -> void:
	$HUD/Placar.text = str(score)
	$HUD/Mensagem.text = " "
	$HUD/Button.hide()
	$AudioTema.play()

func _on_timer_carros_rapidos_timeout() -> void:
	var carros = cenaCarros.instantiate()
	add_child(carros)
	var pista_y = pistas_rapidas_y[randi_range(0, pistas_rapidas_y.size() - 1)]
	carros.position = Vector2(-10, pista_y)
	carros.set_linear_velocity(Vector2(randf_range(700, 720), 0))
	carros.set_linear_damp(0.5)



func _on_timer_carros_lentos_timeout() -> void:
	var carros = cenaCarros.instantiate()
	add_child(carros)
	var pista_y = pistas_lentas_y[randi_range(0, pistas_rapidas_y.size() - 1)]
	carros.position = Vector2(-10, pista_y)
	carros.set_linear_velocity(Vector2(randf_range(700, 720), 0))
	carros.set_linear_damp(0.5)



func _on_player_pontua() -> void:
	if score <= 10:
		score += 1
		$HUD/Placar.text = str(score)
		$AudioPonto.play()
	if score == 10:
		$HUD/Mensagem.text = "Parabens!"
		$HUD/Button.show()
		$TimerCarrosLentos.stop()
		$TimerCarrosLentos.stop()
		$AudioVitoria.play()
		$Player.speed = 0


func _on_hud_reinicia() -> void:
	get_tree().reload_current_scene()
