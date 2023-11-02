extends Node

class_name BrickBreaker

const COLUMNS = 5
const ROWS = 6

@onready var ball = $"../Ball" as Ball
@onready var ui = $"../UI" as UI

@export var brick_sence: PackedScene
@export var margin: Vector2 = Vector2(8,8)
@export var spawn_start: Marker2D

var brick_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn()

func spawn():
	var test_brick = brick_sence.instantiate() as Brick
	add_child(test_brick)
	var brick_size = test_brick.get_size() 
	test_brick.queue_free()
	
	var row_width = brick_size.x * COLUMNS + margin.x * (COLUMNS - 1)
	var spawn_position_x = (-row_width  + brick_size.x  + margin.x) / 1.58
	var spawn_position_y = spawn_start.position.y
	
	for i in ROWS:
		for j in COLUMNS:
			var brick = brick_sence.instantiate() as Brick
			add_child(brick)
			brick.set_level(ROWS - i)
			var x = spawn_position_x + j * (margin.x + brick.get_size().x)
			var y = spawn_position_y + i * (margin.y + brick.get_size().y)
			brick.set_position(Vector2(x, y))
			brick.brick_destoryed.connect(on_brick_destoryed)

func on_brick_destoryed():
	brick_count -= 1
	if brick_count == 0:
		ball.stop_ball() 
