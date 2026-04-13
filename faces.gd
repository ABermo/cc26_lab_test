extends Node2D

@onready var button = $Click_Me
var active = false
var number = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if button.pressed and not active:
		active = true
		await get_tree().create_timer(0.1).timeout
		active = false
		
		number = randi_range(1,10)
		queue_redraw()


func _draw():
	gen_faces(number)
	number = 0

func gen_faces(num):
	for face in range(num):
		var emotion = randi()%2
		
		var x = randi_range(0,1152)
		var y = randi_range(0,648)
		
		draw_circle(Vector2(x,y), 100, Color.RED, false)
