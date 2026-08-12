extends CharacterBody2D

@export var speed = 400.0

func _ready():
	$Polygon2D.polygon = PackedVector2Array([
		Vector2(-25, -25),
		Vector2(25, -25),
		Vector2(25, 25),
		Vector2(-25, 25)
	])

func _physics_process(delta):
	var direction_x = Input.get_axis("ui_left", "ui_right")
	var direction_y = Input.get_axis("ui_up", "ui_down")

	velocity.x = direction_x * speed
	velocity.y = direction_y * speed

	move_and_slide()

	position.x = clamp(position.x, 25, get_viewport_rect().size.x - 25)
	position.y = clamp(position.y, 25, get_viewport_rect().size.y - 25)
