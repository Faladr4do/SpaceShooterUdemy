extends CharacterBody2D

signal levou_dano

@export var velocidade : float = 700
@export var cena_laser : PackedScene

var pode_disparar = true

func _ready():
	pass

func _physics_process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("cima"):
		velocity.y = -velocidade
	if Input.is_action_pressed("baixo"):
		velocity.y = velocidade
	if Input.is_action_pressed("esquerda"):
		velocity.x = -velocidade
	if Input.is_action_pressed("direita"):
		velocity.x = velocidade
	if Input.is_action_pressed("disparar") and pode_disparar:
		pode_disparar = false
		var laser_instanciar = cena_laser.instantiate()
		owner.add_child(laser_instanciar)
		laser_instanciar.global_position = $DoubleGun.global_position
		laser_instanciar = cena_laser.instantiate()
		owner.add_child(laser_instanciar)
		laser_instanciar.global_position = $DoubleGun2.global_position
		await get_tree().create_timer(0.5).timeout
		pode_disparar = true
	#if Input.is_action_pressed("disparar") and pode_disparar:
		#pode_disparar = false
		#var laser_instanciar = cena_laser.instantiate()
		#owner.add_child(laser_instanciar)
		#laser_instanciar.global_position = $Marker2D.global_position
		#await get_tree().create_timer(0.5).timeout
		#pode_disparar = true
	
	move_and_slide()
	limitar_player()

func limitar_player():
	var tamanho_tela = get_viewport_rect().size
	var min_posicao_vector = Vector2(50,120)
	global_position = global_position.clamp(min_posicao_vector, tamanho_tela)

func levar_dano():
	emit_signal("levou_dano")

func morte():
	queue_free()
