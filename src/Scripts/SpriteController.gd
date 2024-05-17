extends CharacterBody2D

signal hit

@onready var _animated_sprite = $AnimatedSprite2D

var speed = 35
var screen_size
var playerVelocityConstant = 1

func _ready():
	screen_size = get_viewport_rect().size
