extends Control

@onready var label_pontuacao = $Pontuacao
@onready var label_vidas = $Vidas

func definir_vidas(vidas : int):
	label_vidas.text = "Vidas: "+ str(vidas)

func definir_pontuacao(pontos: int):
	label_pontuacao.text = "Pontuação: "+ str(pontos)
