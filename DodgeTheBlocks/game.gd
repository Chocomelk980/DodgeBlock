extends Node2D

var block_scene = preload("res://Block.tscn")
var spawn_timer = 0.0
var score = 0
var score_timer = 0.0
var block_speed = 250.0

func _process(delta):
	spawn_timer -= delta
	score_timer += delta

	if spawn_timer <= 0:
		spawn_block()
		spawn_timer = 1.0
		
	if score_timer >= 1.0:
		score += 1
		score_timer = 0.0
		$CanvasLayer/ScoreLabel.text = "Score: " + str(score)
		
		if score % 10 == 0:
			block_speed += 100.0

func spawn_block():
	var block = block_scene.instantiate()
	block.position = Vector2(
		randf_range(25, get_viewport_rect().size.x - 25),
		0
	)
	block.speed = block_speed
	add_child(block)

func _on_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
