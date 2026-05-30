extends Control

var episodeSelected : String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("Intro")
	

# This is the skip button
func _on_skip_button_pressed() -> void:
	if $AnimationPlayer.current_animation == "Intro":
		$AnimationPlayer.stop()
		$IntroContainer.visible = false
		$MainMenuContainer.visible = true
		$AnimationPlayer.play("MainMenu")
	print("Pressed")

# This is the new game button
func _on_new_game_pressed() -> void:
	$MainMenuContainer.visible = false
	$EpisodeSelection.visible = true
	print("New Game Pressed")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Intro":
		$AnimationPlayer.play("MainMenu")
		
# Back button pressed
func _on_back_pressed() -> void:
	%EpisodeSelection.visible = false
	$MainMenuContainer.visible = true
	$ComingSoon.visible = false
	
# Exit button
func _on_exit_pressed() -> void:
	get_tree().quit()

# Credits
func _on_credits_pressed() -> void:
	$MainMenuContainer.visible = false
	$Credits.visible = true
	$AnimationPlayer.play("Credits")
	%Back2.visible = true

func _on_back_2_pressed() -> void:
	$Credits.visible = false
	$AnimationPlayer.stop()
	%EpisodeSelection.visible = false
	$MainMenuContainer.visible = true
	%Back2.visible = false

func _on_play_pressed() -> void:
	print("Episode Selected: ", episodeSelected)
	match episodeSelected:
		"EpisodeOne":
			get_tree().change_scene_to_file("res://Ep1/Scenes/SceneA1.tscn")
		"EpisodeTwo":
			%EpisodeSelection.visible = false
			$ComingSoon.visible = true
		"EpisodeThree":
			%EpisodeSelection.visible = false
			$ComingSoon.visible = true
		"EpisodeFour":
			%EpisodeSelection.visible = false
			$ComingSoon.visible = true
		"EpisodeFive":
			%EpisodeSelection.visible = false
			$ComingSoon.visible = true
	

# All Episodes
# call the EpisodeTitle & EpisodeDesc
func _on_episode_one_pressed() -> void:
	episodeSelected = "EpisodeOne"
	%EpisodeTitle.text = "All I Feel And See"
	%EpisodeTDesc.text = "Jolina Route, Marvin still in works"

func _on_episode_two_pressed() -> void:
	episodeSelected = "EpisodeTwo"
	%EpisodeTitle.text = "Coming Soon!"
	%EpisodeTDesc.text = "This episode is still in works, stay tuned on our facebook page!"

func _on_episode_three_pressed() -> void:
	episodeSelected = "EpisodeThree"
	%EpisodeTitle.text = "Coming Soon!"
	%EpisodeTDesc.text = "This episode is still in works, stay tuned on our facebook page!"


func _on_episode_four_pressed() -> void:
	episodeSelected = "EpisodeFour"
	%EpisodeTitle.text = "Coming Soon!"
	%EpisodeTDesc.text = "This episode is still in works, stay tuned on our facebook page!"


func _on_episode_five_pressed() -> void:
	episodeSelected = "EpisodeFive"
	%EpisodeTitle.text = "Coming Soon!"
	%EpisodeTDesc.text = "This episode is still in works, stay tuned on our facebook page!"

func _on_go_back_pressed() -> void:
	$ComingSoon.visible = false
	%EpisodeSelection.visible = true
