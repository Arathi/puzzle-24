@tool
extends Node2D


const font = preload("res://assets/fonts/NotoSans-Regular.ttf")
const red = Color.RED
const black = Color.BLACK


enum Suit {
	Hearts, 
	Diamonds,
	Clubs,
	Spades,
}


@export var suit: Suit = Suit.Clubs:
	set(value):
		suit = value
		update()


@export_range(1, 13) var point: int = 1:
	set(value):
		point = value
		update()


@onready var fg = $FG
@onready var bg = $BG


var suit_icon: String:
	get:
		match suit:
			Suit.Hearts: return '♥'
			Suit.Diamonds: return '♦'
			Suit.Clubs: return '♣'
			Suit.Spades: return '♠'
		return ''


var point_text: String:
	get:
		match point:
			1: return 'A'
			2: return '2'
			3: return '3'
			4: return '4'
			5: return '5'
			6: return '6'
			7: return '7'
			8: return '8'
			9: return '9'
			10: return '10'
			11: return 'J'
			12: return 'Q'
			13: return 'K'
		return ''


var color: Color:
	get:
		if suit == Suit.Hearts or suit == Suit.Diamonds:
			return red
		return black


var card_file_name: String:
	get:
		var pt: String = ''
		match point:
			1: pt = 'ace'
			2: pt = '2'
			3: pt = '3'
			4: pt = '4'
			5: pt = '5'
			6: pt = '6'
			7: pt = '7'
			8: pt = '8'
			9: pt = '9'
			10: pt = '10'
			11: pt = 'jack'
			12: pt = 'queen'
			13: pt = 'king'
		
		var st: String = ''
		match suit:
			Suit.Clubs: st = 'clubs'
			Suit.Diamonds: st = 'diamonds'
			Suit.Hearts: st = 'hearts'
			Suit.Spades: st = 'spades'
		
		return '%s_of_%s' % [pt, st]


func _ready():
	update()
	pass


func _process(delta):
	if Engine.is_editor_hint():
		# update()
		pass


func update():
	if is_node_ready():
		var path = "res://assets/cards/%s.png" % card_file_name
		print("加载图片资源：%s" % path)
		fg.texture = load(path)
