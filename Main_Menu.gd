extends Node3D

@onready var lighting = $Lighting
var can_strike = true

# Called when the node enters the scene tree for the first time.
func _ready():
	lighting.hide()
	lightning_sequence()

func change_scene(target: String) -> void:
	get_tree().change_scene_to_file(target)

func lightning_sequence():
	while true:
		if can_strike:
			var random_generator = RandomNumberGenerator.new()
			var strike_time = random_generator.randi_range(1.0, 5.0)
			var random_generator2 = RandomNumberGenerator.new()
			var hold_time = random_generator.randi_range(0.2, 0.8)
			await get_tree().create_timer(strike_time).timeout
			
			# Lightning strike
			lighting.show()
			await get_tree().create_timer(hold_time).timeout
			lighting.hide()
			await get_tree().create_timer(0.05).timeout
			lighting.show()
			await get_tree().create_timer(0.09).timeout
			lighting.hide()
			
			# Wait before allowing another strike
			can_strike = false
			await get_tree().create_timer(1.0).timeout
			can_strike = true
		else:
			# If can't strike, wait a short time before checking again
			await get_tree().create_timer(0.5).timeout


func _on_start_game_pressed():
	change_scene("res://building.tscn")
