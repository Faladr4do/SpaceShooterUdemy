extends Node2D

@export var cena_game_over : PackedScene
@export var parallax_velocidade : float = 100

@onready var ui = $HUD/UI
@onready var spawner = $MobSpawner
@onready var jogador = $Player
@onready var scroll_background = $ParallaxBackground

var pontos_jogador : int = 0
var vidas : int = 3

func _ready():
	vidas = 3
	pontos_jogador = 0
	ui.definir_pontuacao(pontos_jogador)
	ui.definir_vidas(vidas)

func _process(delta):
	scroll_background.offset.x -= parallax_velocidade * delta
	if scroll_background.offset.x <= -get_viewport().get_window().size.x:
		scroll_background.offset.x = 0

func _on_mob_spawner_spawnar_inimigo(inimigo):
	inimigo.connect("atribuir_pontos", ao_atribuir_pontos)
	spawner.add_child(inimigo)

func ao_atribuir_pontos(pontos):
	pontos_jogador += pontos
	ui.definir_pontuacao(pontos_jogador)


func _on_player_levou_dano():
	vidas -= 1
	ui.definir_vidas(vidas)
	if vidas == 0:
		jogador.morte()
		var game_over_instanciar = cena_game_over.instantiate()
		await get_tree().create_timer(1).timeout
		game_over_instanciar.atribuir_pontos(pontos_jogador)
		ui.add_child(game_over_instanciar)
