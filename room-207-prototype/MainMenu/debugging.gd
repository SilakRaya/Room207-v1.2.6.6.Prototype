extends Control

@export var message : String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/Label.text = message
