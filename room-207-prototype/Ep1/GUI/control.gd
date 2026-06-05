extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_talk_button_pressed() -> void:
	Input.action_press("mobile_dialogue")
	Input.action_release("mobile_dialogue")


func _on_left_button_pressed() -> void:
	Input.action_press("move_left")
	Input.action_release("move_left")


func _on_right_button_pressed() -> void:
	Input.action_press("move_right")
	Input.action_release("move_right")
