extends Control

onready var suslevelbar = $SusLevel

func _ready():
	suslevelbar.value = 0

func set_percent_value_int(value):
	suslevelbar.value = value
