extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("TheInBituin")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "TheInBituin":
		get_tree().change_scene_to_file("res://Ep1/Scenes/SceneA2.tscn")
