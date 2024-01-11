extends Area2D

signal atribuir_pontos(pontos)

@onready var cena = $"."
@export var cena_power : PackedScene
@export var velocidade : float = 300
@export var pontos : int = 30
var power_up = false

func _ready():
	add_to_group("Inimigo")

func _process(delta):
	global_position.x += -velocidade * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func morte():
	emit_signal("atribuir_pontos", pontos)
	if power_up:
		var power_up = cena_power.instantiate()
		owner.add_child(power_up)
		power_up.global_position = cena.global_position
		print(power_up)
		cena.hide()
	queue_free()

func _on_body_entered(body):
	body.levar_dano()
	if body:
		power_up = true
	morte()
