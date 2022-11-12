extends Area2D

signal sus(amount)




func _on_findplayer_area_entered(area):
	emit_signal("sus","sus")
