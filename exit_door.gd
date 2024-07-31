extends Interactable

var playback : AnimationNodeStateMachinePlayback
var open = false
var closed = true
var locked = false
var can_interact = true

@onready var animationplayer = $"../../AnimationPlayer"


func _ready():
	pass
	#playback = $"../../AnimationTree".get("parameters/playback")


func _on_interacted(body):
	if can_interact == true:
		if locked == false:
			if open == false:
				can_interact = false
				open = true
				closed = false
				animationplayer.play("Open")
				await get_tree().create_timer(2.5).timeout
				can_interact = true
			if closed == false:
				can_interact = false
				animationplayer.play("Close")
				closed = true
				open = false
				await get_tree().create_timer(1.5).timeout
				can_interact = true
		else:
			can_interact = false
			animationplayer.play("Locked_open_attempt")
			await get_tree().create_timer(0.5).timeout
			can_interact = true


func _on_area_3d_player_has_exited():
	can_interact = false
	locked = true
	if closed == false:
		animationplayer.play("Close")
	await get_tree().create_timer(1.0).timeout
	can_interact = true
