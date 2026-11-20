extends Area2D

var speed = 250
var direction = Vector2(-1, 1)
var fixed_direction = direction.normalized()
func _process(delta):
	position = position + direction * speed * delta
	if position.x < -200 or position.x > 1350 or position.y < -200 or position.y > 850:
		queue_free()


func _on_body_entered(body):
	get_parent().game_over()
