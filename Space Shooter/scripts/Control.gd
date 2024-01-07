extends Control

@export var parallax_velocidade : float = 100
@onready var scroll_background = $ParallaxBackground

func _process(delta):
	scroll_background.offset.x -= parallax_velocidade * delta
	if scroll_background.offset.x <= -get_viewport().get_window().size.x:
		scroll_background.offset.x = 0


func _on_botao_jogar_pressed():
	get_tree().change_scene_to_file("res://cenas/jogo.tscn")


func _on_botao_sair_pressed():
	get_tree().quit()
