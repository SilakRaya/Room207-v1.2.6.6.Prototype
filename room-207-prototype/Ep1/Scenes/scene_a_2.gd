extends Node2D

func _ready() -> void:
	$CameraZoom.play("zoomOut")
	$Event.play("FadeIn")
	#this method prevents inputs
	$Player/Dialogue.set_process(false)
	$ColorRect.visible = true
	$Player/Dialogue.visible = false

func _process(_delta: float) -> void:
	wake_Jolina()

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
