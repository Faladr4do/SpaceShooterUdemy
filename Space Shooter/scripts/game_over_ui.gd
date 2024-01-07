extends Control

func atribuir_pontos(pontos: int):
	var label_pontuacao = $Panel/Pontuacao
	label_pontuacao.text = "Pontuação: "+ str(pontos)

func _on_button_pressed():
	get_tree().reload_current_scene()
