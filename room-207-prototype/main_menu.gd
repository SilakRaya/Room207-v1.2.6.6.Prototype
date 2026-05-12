extends Control

@onready var new_game_button = $NewGame
@onready var options_button = $Options
@onready var credits_button = $Credits

func _ready():
	new_game_button.pressed.connect(_on_new_game_pressed)
	options_button.pressed.connect(_on_options_pressed)
	credits_button.pressed.connect(_on_credits_pressed)

func _on_new_game_pressed():
	print("New Game button pressed")

func _on_options_pressed():
	print("Options button pressed")

func _on_credits_pressed():
	print("Credits button pressed")
