extends Node

var HOVER_SCALE := Vector2(1.2, 1.2)
var NORMAL_SCALE := Vector2.ONE
var tween:Tween
var buttons:Array[Button]
var button_tweens := {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame
	
	buttons = [%NewGame,%Options,%Credits,%Exit]
	
	for button in buttons:
		button.pivot_offset = button.size / 2

func animate_button(button: Control, target_scale: Vector2, duration: float) -> void:
	if button_tweens.has(button):
		var old_tween = button_tweens[button]
		if old_tween:
			old_tween.kill()
	var tween := create_tween()
	button_tweens[button] = tween
	tween.set_trans(Tween.TRANS_QUINT)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(button, "scale", target_scale, duration)

func set_hovered_button(hovered: Control) -> void:
	for button in buttons:
		if button == hovered:
			animate_button(button, HOVER_SCALE, 0.25)
		else:
			animate_button(button, NORMAL_SCALE, 0.20)


func _on_new_game_mouse_entered() -> void:
	set_hovered_button(%NewGame)


func _on_new_game_mouse_exited() -> void:
	animate_button(%NewGame, NORMAL_SCALE, 0.20)


func _on_options_mouse_entered() -> void:
	set_hovered_button(%Options)


func _on_options_mouse_exited() -> void:
	animate_button(%Options, NORMAL_SCALE, 0.20)


func _on_credits_mouse_entered() -> void:
	set_hovered_button(%Credits)


func _on_credits_mouse_exited() -> void:
	animate_button(%Credits, NORMAL_SCALE, 0.20)


func _on_exit_mouse_entered() -> void:
	set_hovered_button(%Exit)


func _on_exit_mouse_exited() -> void:
	animate_button(%Exit, NORMAL_SCALE, 0.20)
