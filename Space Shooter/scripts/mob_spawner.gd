extends Node2D

signal spawnar_inimigo(inimigo)

@onready var posicoes_spawn : Node2D = $PosicoesSpawn

@export var cena_inimigo : PackedScene

func _on_timer_timeout():
	var posicao_spawn_array = posicoes_spawn.get_children()
	var posicao_random : Node2D = posicao_spawn_array.pick_random()
	var inimigo_instanciar = cena_inimigo.instantiate()
	inimigo_instanciar.global_position = posicao_random.global_position
	emit_signal("spawnar_inimigo", inimigo_instanciar)
