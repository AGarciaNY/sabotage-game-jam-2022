extends Control

onready var sus_level_bar = $SusLevel

func _ready():
	Signals.connect("is_sus", self, "_on_sus_update")
	

func _on_sus_update():
	print("health amounth")
