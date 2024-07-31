extends MeshInstance3D

@onready var light = $OmniLight3D
var flickring = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Lflickring()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass


func Lflickring():
	while true:
		if flickring:
			var flickwait_generator = RandomNumberGenerator.new()
			var flickwait = flickwait_generator.randi_range(1.0, 4.0)
			
			var flick1_generator = RandomNumberGenerator.new()
			var flick1 = flick1_generator.randi_range(0.5, 1.0)
			
			var flick2_generator = RandomNumberGenerator.new()
			var flick2 = flick2_generator.randi_range(0.4, 0.8)
			
			var flick3_generator = RandomNumberGenerator.new()
			var flick3 = flick3_generator.randi_range(0.5, 1.0)
			
			light.show()
			await get_tree().create_timer(flickwait).timeout
			light.hide()
			await get_tree().create_timer(flick1).timeout
			light.show()
			await get_tree().create_timer(flick2).timeout
			light.hide()
			await get_tree().create_timer(flick3).timeout
