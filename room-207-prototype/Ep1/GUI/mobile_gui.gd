extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_continue_pressed() -> void:
	Input.action_press("mobile_dialogue")
	await get_tree().process_frame
	Input.action_release("mobile_dialogue")


func _on_left_movement_pressed() -> void:
	Input.action_press("move_left")


func _on_right_movement_pressed() -> void:
	Input.action_press("move_right")
