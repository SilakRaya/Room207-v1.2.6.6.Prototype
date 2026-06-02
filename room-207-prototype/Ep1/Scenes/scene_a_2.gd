extends Node2D

var is_animating = false
var act:int = 1

func _ready() -> void:
	$CameraZoom.play("zoomOut")
	$Event.play("FadeIn")
	#this method prevents inputs
	$Player/Dialogue.set_process(false)
	$ColorRect.visible = true
	$Player/Dialogue.visible = false
	#$Player/Camera2D/Debugging.message = "Zoom out finished!"

func _process(_delta: float) -> void:
	match act:
		1:
			wake_Jolina()
		2:
			lookAround_Jolina()
		3:
			print("Act end")
	
func _on_camera_zoom_animation_finished(anim_name: StringName) -> void:
	if anim_name == "zoomOut":
		print("Zoom out finished")
		$CameraZoom.play("Idle")

func _on_event_animation_finished(anim_name: StringName) -> void:
	if anim_name == "FadeIn":
		$Event.play("dialogueFadeIn")
		await $Event.animation_finished
		print("Player can now press inputs")
		$Player/Dialogue.set_process(true)

func wake_Jolina() -> void:
	var currentDialogue = $Player/Dialogue.dialogue
	print("Dialogue index : ", currentDialogue)
	match currentDialogue:
		2:
			# since this is just a placeholder
			# use await if there is an asset
			print("Jolina animation wakes up!")
		6:
			print("Jolina animation stands up!zzz")
		7:
			act = 2
			return

func lookAround_Jolina() -> void:
	var currentDialogue = $Player/Dialogue.dialogue

# this is still buggy i will find a solution on this -ken
	match currentDialogue:
		11:
			if not is_animating:
				is_animating = true
				$CameraZoom.play("moveLeft")
				await $CameraZoom.animation_finished
				print("Move camera to the left finished")
				is_animating = false
				
		12:
			$CameraZoom.play("moveRight")
			await $CameraZoom.animation_finished
			print("Move camera to the right finished")
			return
		13:
			$CameraZoom.play("reset")
			await $CameraZoom.animation_finished
			print("Goes back to original position")
			return
			
