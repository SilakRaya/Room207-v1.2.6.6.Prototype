extends Node2D  # or Control if your root is a Control node

@onready var animation_player = $AnimationPlayer

func _ready():
	animation_player.animation_finished.connect(_on_animation_finished)
	animation_player.play("intro")  # Change "intro" to your animation's actual name

func _on_animation_finished(anim_name):
	# Switch to MainMenu scene
	get_tree().change_scene_to_file("res://MainMenu.tscn")  # Adjust path as needed
