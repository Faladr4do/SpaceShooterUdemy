extends Area2D

@export var velocidade : float = 250

var tempo : float = 10

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	body.power_up = true
	body.power_up_handler(tempo)

func power_heal():
	tempo = 0

func power_shield():
	pass

func power_doublegun():
	pass

func power_speed():
	tempo = 15
	
