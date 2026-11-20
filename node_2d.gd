extends Node2D

var load = preload("res://node2_2d.tscn")
var score_time = 0.0

func _ready():
	$GameOverLabel.hide()
	$RestartButton.hide()
	$score.hide()

func _process(delta):
	score_time += delta
	$ScoreLabel.text = "Score: " + str(int(score_time))
func _on_timer_timeout():
	var side = randi_range(0, 1)
	var count = get_tree().get_nodes_in_group("obstacles").size()
	if count > 4:
		return
	var plsload = load.instantiate()
	var obstacle = load.instantiate()
	var randomy = randf_range(0, 680)
	$Timer.wait_time = max($Timer.wait_time - 0.05, 0.7)
	if side == 0:
		obstacle.direction = Vector2(-1, randf_range(-0.5, 0.5))
		obstacle.position = Vector2(1200, randomy)
	else:
		obstacle.direction = Vector2(1, randf_range(-0.5, 0.5))
		obstacle.position = Vector2(-100, randomy)
			
	add_child(obstacle)
	
func game_over():
	$Timer.stop()
	$score.text = "Score: " + str(int(score_time))
	$GameOverLabel.show()
	$RestartButton.show()
	$score.show()
	get_tree().paused = true


func _on_restart_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
