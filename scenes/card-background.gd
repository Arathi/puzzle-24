@tool
extends Node2D


@export var width: float = 222:
	set(value):
		width = value
		update()


@export var height: float = 323:
	set(value):
		width = value
		update()


@export var radius: float = 16:
	set(value):
		radius = value
		update()


func _ready():
	queue_redraw()
	pass


func _process(delta):
	pass


func _draw():
	var r = radius
	var w = width
	var h = height
	var rect_a = Rect2(r, 0, w-2*r, h)
	var rect_b = Rect2(0, r, w, h-2*r)
	draw_circle(Vector2(r,r), r, Color.WHITE)
	draw_circle(Vector2(w-r,r), r, Color.WHITE)
	draw_circle(Vector2(r, h-r), r, Color.WHITE)
	draw_circle(Vector2(w-r, h-r), r, Color.WHITE)
	draw_rect(rect_a, Color.WHITE, true)
	draw_rect(rect_b, Color.WHITE, true)
	pass


func update():
	queue_redraw()

