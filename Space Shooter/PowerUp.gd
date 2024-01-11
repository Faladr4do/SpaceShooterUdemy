extends Area2D

@export var velocidade : float = 250



func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	area.power_up = true
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
