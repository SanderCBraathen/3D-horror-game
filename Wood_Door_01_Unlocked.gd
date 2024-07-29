extends Interactable

var playback : AnimationNodeStateMachinePlayback
var is_open := false
var locked = false
var can_interact = true

@onready var timer = $"../../Timer"


func _ready():
	playback = $"../../AnimationTree".get("parameters/playback")


func _on_interacted(body):
	if can_interact == true:
		if locked == false:
			is_open = not is_open
			if is_open:
				can_interact = false
				playback.travel("Open")
				await get_tree().create_timer(2.5).timeout
				can_interact = true
			else:
				can_interact = false
				playback.travel("Close")
				await get_tree().create_timer(1.5).timeout
				can_interact = true
		else:
			$"../../AnimationPlayer".play("locked_open_attempt")
