extends Node3D

@onready var Interior01 = $Interior_01
var hidden = false
var showing = true
@onready var FPS = $Label



# Called every frame. 'delta' is the elapsed time since the previous frame.

#func _input(event):
	#if showing == true:
		#if Input.is_action_just_pressed("interact"):
			#Interior01.hide()
			#hidden = true
			#showing = false
	#else:
		#if Input.is_action_just_pressed("interact"):
			#Interior01.show()
			#hidden = false
			#showing = true
