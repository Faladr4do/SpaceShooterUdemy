extends Area2D

signal atribuir_pontos(pontos)

@export var velocidade : float = 300
@export var pontos : int = 10

func _ready():
	add_to_group("Inimigo")

func _process(delta):
	global_position.x += -velocidade * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func morte():
	emit_signal("atribuir_pontos", pontos)
	queue_free()

func _on_body_entered(body):
	body.levar_dano()
	morte()
