extends Area3D

var player_entered = false
signal player_has_exited

func _ready():
	# Connect the body_entered and body_exited signals
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_entered = true
		print("Player entered the area")
		emit_signal("player_has_exited")

func _on_body_exited(body):
	if body.is_in_group("player"):
		print("Player exited the area")

func has_player_entered():
	return player_entered
