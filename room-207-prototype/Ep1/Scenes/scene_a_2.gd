extends Node2D

func _ready() -> void:
	$camera_zoom_out.play("camera_zoom_out")
	$audio.play("Firefly")
