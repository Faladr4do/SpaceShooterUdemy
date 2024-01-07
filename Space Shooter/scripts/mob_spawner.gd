extends Node2D

signal spawnar_inimigo(inimigo)
signal spawnar_rocha(rocha)

@onready var posicoes_spawn : Node2D = $PosicoesSpawn

@export var cena_inimigo : PackedScene
@export var cena_rocha : PackedScene

func _on_timer_timeout():
	var posicao_spawn_array = posicoes_spawn.get_children()
	var posicao_random : Node2D = posicao_spawn_array.pick_random()
	var inimigo_instanciar = cena_inimigo.instantiate()
	inimigo_instanciar.global_position = posicao_random.global_position
	emit_signal("spawnar_inimigo", inimigo_instanciar)


func _on_timer_rocha_timeout():
	var posicao_spawn_array = posicoes_spawn.get_children()
	var posicao_random : Node2D = posicao_spawn_array.pick_random()
	var rocha_instanciar = cena_rocha.instantiate()
	rocha_instanciar.global_position = posicao_random.global_position
	emit_signal("spawnar_rocha", rocha_instanciar)
