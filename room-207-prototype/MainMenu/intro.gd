extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%Label.visible = false
	$AnimationPlayer.play("Intro")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Intro":
		get_tree().change_scene_to_file("res://MainMenu/MainMenu.tscn")


func _on_skip_button_pressed() -> void:
	get_tree().change_scene_to_file("res://MainMenu/MainMenu.tscn")
