extends Node2D

@onready var fade = $AnimationPlayer

@onready var slide_01 = $"Thx For Playing"


# Called when the node enters the scene tree for the first time.
func _ready():
	fade.play("Fade_Back")
	slide_01.show()
	await get_tree().create_timer(3.0).timeout
	fade.play("Fade_Black")
	await get_tree().create_timer(1.5).timeout
	slide_01.hide()
	fade.play("Fade_Back")
