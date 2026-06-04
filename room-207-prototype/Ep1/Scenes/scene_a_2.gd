extends Node2D

var move_left_started : bool = false
var move_right_started : bool = false
var move_reset : bool = false
var zoom_To_Jolina : bool = false
var firefly_Move : bool = false
var firefly_Idle : bool = false
var firefly_leave : bool = false
var move_slightly_left : bool = false
var move_reset2 : bool = false
var player_Reached_The_Stairs = false

func _ready() -> void:
	$CameraZoom.play("zoomOut")
	$Event.play("FadeIn")
	#this method prevents inputs
	%Dialogue.set_process(false)
	$ColorRect.visible = true
	$Dialogue.visible = false
	%Firefly2.visible = false
	$Player/Jolina.visible = false
	$Player/Jolina.set_process(false)
	

func _process(_delta: float) -> void:
	dialogue_Sequence()

func dialogue_Sequence():
	var index = %Dialogue.dialogue
	
	match (index):
		14:
			if not move_left_started:
				move_left_started = true
				$CameraZoom.play("moveLeft")
				%Dialogue.set_process(false)
		15:
			if not move_right_started:
				move_right_started = true
				$CameraZoom.play("moveRight")
				%Dialogue.set_process(false)
		16:
			if not move_reset:
				move_reset = true
				$CameraZoom.play("reset")
				%Dialogue.set_process(false)
		19:
			if not zoom_To_Jolina:
				zoom_To_Jolina = true
				$CameraZoom.play("zoom_In_Jolina")
				%Dialogue.set_process(false)
		22:
			if not firefly_Move:
				firefly_Move = true
				$Event.play("FireFly_Go_Jolina")
				%Dialogue.set_process(false)
		23:
			if not firefly_Idle:
				firefly_Idle = true
				$Event.play("Firefly_Idle") # this is a loop animation
				%Dialogue.set_process(true)
		26:
			if not firefly_leave:
				firefly_leave = true
				$Event.play("firefly_Leave")
				%Dialogue.set_process(false)
		27:
			if not move_slightly_left:
				move_slightly_left = true
				$CameraZoom.play("move_slightly_left")
				%Dialogue.set_process(false)
		28:
			if not move_reset2:
				move_reset2 = true
				$CameraZoom.play("reset2")
				%Dialogue.set_process(false)
		30:
			$EventObstacles.visible = false
			%Dialogue.visible = false
			$Player/Camera2D.enabled = false
			$Player/JolinaA1.visible = false
			$Player/Jolina.visible = true
			$Player/Jolina.set_process(true)

func _on_camera_zoom_animation_finished(anim_name: StringName) -> void:
	if anim_name == "zoomOut":
		print("Zoom out finished")
		$CameraZoom.play("Idle")
	
	if anim_name == "moveLeft":
		print("Moving Left Finished")
		%Dialogue.set_process(true)
	
	if anim_name == "moveRight":
		print("Moving Right Finished")
		$Dialogue.set_process(true)
	
	if anim_name == "reset":
		$Dialogue.set_process(true)
	
	if anim_name == "reset2":
		$Dialogue.set_process(true)
		
	if anim_name == "zoom_In_Jolina":
		print("Close up to Jolina Finished")
		$Dialogue.set_process(true)
	
	if anim_name == "move_slightly_left":
		$Dialogue.set_process(true)

func _on_event_animation_finished(anim_name: StringName) -> void:
	if anim_name == "FadeIn":
		$Event.play("dialogueFadeIn")
		await $Event.animation_finished
		print("Player can now press inputs")
		$Dialogue.set_process(true)
	
	if anim_name == "FireFly_Go_Jolina":
		$Event.play("Firefly_Idle")
		$Dialogue.set_process(true)
	
	if anim_name == "firefly_Leave":
		$Dialogue.set_process(true)


func _on_area_2d_body_entered(_body: CharacterBody2D) -> void:
	#this should only happen once
	if not player_Reached_The_Stairs:
		player_Reached_The_Stairs = true
		print("Play animation firefly going upstairs!")
	print("Player Enters show prompt")


func _on_area_2d_body_exited(_body: CharacterBody2D) -> void:
	print("Player Leaves hide prompt")
