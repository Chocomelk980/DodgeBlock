extends Area2D

@export var speed = 250.0

func _ready():
	$Polygon2D.polygon = PackedVector2Array([
		Vector2(-25, -25),
		Vector2(25, -25),
		Vector2(25, 25),
		Vector2(-25, 25)
	])

func _process(delta):
	position.y += speed * delta

	if position.y > get_viewport_rect().size.y + 50:
		queue_free()


func _on_body_entered(body):
	if body.name == "Player":
		print("PLAYER HIT!")
		print("ENDING SEQUENCE...")

		var game_over_label = get_tree().current_scene.get_node("CanvasLayer/Label")
		game_over_label.visible = true

		get_tree().current_scene.get_node("CanvasLayer/Button").visible = true
		get_tree().paused = true
