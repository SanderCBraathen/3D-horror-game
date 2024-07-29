extends Interactable

var open = false
var locked = false
var can_interact = true

@onready var animationplayer = $"../../AnimationPlayer"

func _ready():
	pass

func open_door():
	open = true
	animationplayer.play("Open")

func close_door():
	open = false
	animationplayer.play("Close")

func locked_attempt():
	can_interact = false
	animationplayer.play("Locked_open_attempt")
	await get_tree().create_timer(0.5).timeout
	can_interact = true


func _on_interacted(body):
	if can_interact and not locked:
		can_interact = false
		
		if not open:
			open_door()
		else:
			close_door()
		
		await get_tree().create_timer(1.5).timeout
		can_interact = true
	elif locked:
		locked_attempt()
