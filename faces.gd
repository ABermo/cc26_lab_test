extends Node2D

@onready var button = $Click_Me
var active = 0

var happy = 0
var sad = 0

var x_loc = []
var y_loc = []
var r_past = []
var color_past = []
var emotion_past = []
var eyes_past = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if button.button_pressed and active == 0:
		active = 1
		queue_redraw()
		
		
func _draw():
	gen_faces()
	draw_faces()
	active = 0

func gen_faces():
	if active == 1:
		var num = randi_range(1,10)
		
		for face in range(num):
			var emotion = randi()%2
			var x = randi_range(0,1152)
			var y = randi_range(0,648)
			var r = randi_range(20,150)
			var eyes = randi_range(2,6)
			var color = Color.from_hsv(randf_range(0,1),randf_range(0,1),randf_range(0,1))
			
			x_loc.append(x)
			y_loc.append(y)
			r_past.append(r)
			eyes_past.append(eyes)
			color_past.append(color)
			emotion_past.append(emotion)


func draw_faces():
	happy = 0
	sad = 0
	for face in range(len(x_loc)):
		var x = x_loc[face]
		var y = y_loc[face]
		var r = r_past[face]
		var color = color_past[face]
		var emotion = emotion_past[face]
		var eyes = eyes_past[face]
		
		draw_circle(Vector2(x,y), r, color, false)
			
		var y1 = y + (r/3.0)
		var x1 = x - (r/2.0)
		var x2 = x + (r/2.0)
		
		draw_line(Vector2(x1,y1),Vector2(x2,y1), color)
		
		if emotion == 0:
			draw_line(Vector2(x1,y1), Vector2((x1 - r/3.0), (y1 - r/3.0)), color)
			draw_line(Vector2(x2,y1), Vector2((x2 + r/3.0), (y1 - r/3.0)), color)
			happy += 1
			
		if emotion == 1:
			draw_line(Vector2(x1,y1), Vector2((x1 - r/3.0), (y1 + r/3.0)), color)
			draw_line(Vector2(x2,y1), Vector2((x2 + r/3.0), (y1 + r/3.0)), color)
			sad += 1
			
		draw_circle(Vector2(x, y - r/2.0), r*0.1, color, false)
		draw_circle(Vector2(x - r*0.3, y - r/2.0), r*0.1, color, false)
	
		if eyes >= 3:
			draw_circle(Vector2(x + r*0.3, y - r/2.0), r*0.1, color, false)
		if eyes >= 4:
			draw_circle(Vector2(x - r*0.6, y - r/2.0), r*0.1, color, false)
		if eyes >= 5:
			draw_circle(Vector2(x + r*0.6, y - r/2.0), r*0.1, color, false)
		if eyes == 6:
			draw_circle(Vector2(x, y - r/4.0), r*0.1, color, false)
	$Happy.text = str('Happy: ', happy)
	$Sad.text = str('Sad: ', sad)
