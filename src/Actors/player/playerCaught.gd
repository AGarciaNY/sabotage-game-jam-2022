extends Area2D



func _on_Area2D_area_entered(area) -> void:
	Signals.emit_signal("is_sus",1)
