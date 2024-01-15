extends Area2D

@export var velocidade : float = 800

func _process(delta):
	global_position.x += velocidade * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	if area.is_in_group("Inimigo"):
		area.morte()
		queue_free()
