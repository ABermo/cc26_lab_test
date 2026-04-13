extends Node2D

@onready var button = $Click_Me
var active = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
		
func _draw():
	gen_faces()

func _on_button_pressed() -> void:
	queue_redraw()
	
func gen_faces():
	if button.pressed and active != 1:
		active = 1
	else:
		active = 0
		
	if active == 1:
		var num = randi_range(1,10)
		
		for face in range(num):
			var emotion = randi()%2

			var x = randi_range(0,1152)
			var y = randi_range(0,648)
			var r = randi_range(20,150)
			
			draw_circle(Vector2(x,y), r, Color.RED, false)
			
			y = y + (r/3)
			var x1 = x - (r/2)
			var x2 = x + (r/2)
			
			draw_line(Vector2(x1,y),Vector2(x2,y), Color.RED)
			
			if emotion == 0:
				draw_line(Vector2(x1,y), Vector2((x1 - r/3), (y - r/3)), Color.RED)
				draw_line(Vector2(x2,y), Vector2((x2 + r/3), (y - r/3)), Color.RED)
			if emotion == 1:
				draw_line(Vector2(x1,y), Vector2((x1 - r/3), (y + r/3)), Color.RED)
				draw_line(Vector2(x2,y), Vector2((x2 + r/3), (y + r/3)), Color.RED)
	active = 0
