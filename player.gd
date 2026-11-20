extends CharacterBody2D

const speed = 300
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	move_and_slide()
	position.x = clamp(position.x, 60, 1090)
	position.y = clamp(position.y, 60, 590)
