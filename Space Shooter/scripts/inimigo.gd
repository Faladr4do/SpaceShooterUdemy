extends Area2D

signal atribuir_pontos(pontos)

@onready var sprite = $Sprite2D
@onready var collision = $"."
@export var cena_power : PackedScene
@export var velocidade : float = 300
@export var pontos : int = 30

var rng = 0
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
		
		var cena_power_up = cena_power.instantiate()
		add_child(cena_power_up)
		cena_power_up.global_position = sprite.global_position
		print(power_up)
		sprite.hide()
		collision.monitoring = false
	else:
		queue_free()

func _on_body_entered(body):
	body.levar_dano()
	morte()

func _on_area_entered(area):
	rng = randi_range(0, 100)
	if rng >= 75:
		power_up = true

func randomizar_loot():
	rng = randi_range(0,10)
	print(rng)
	#It will see if
	cena_power.power = 5
