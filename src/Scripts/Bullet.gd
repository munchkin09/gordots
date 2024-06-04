class_name Bullet extends CharacterBody2D

var speed = Vector2(8000,0.0)
@export_range(0, 360) var arc: float = 0
var bullet_direction : int
@onready var animated_sprite = $AnimatedSprite2D
var destroying = false;

func _ready():
	animated_sprite.play("default")
	if bullet_direction == -1:
		animated_sprite.flip_h = true

func _process(_delta):
	if not destroying:
		velocity.x = bullet_direction * speed.x * _delta
		move_and_slide()

func _physics_process(_delta):
	pass

func destroy():
	destroying = true
	animated_sprite.play('explosion')
	velocity.x = 0
	await get_tree().create_timer(1.0).timeout
	self.free()
