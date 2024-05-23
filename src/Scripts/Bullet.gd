class_name Bullet extends CharacterBody2D

var speed = Vector2(0.2,0.2)
# Esto se convierte en opciones parametrizables desde la interfaz gráfica!
@export_range(0, 360) var arc: float = 0
var bullet_direction : Vector2
@onready var animated_sprite = $AnimatedSprite2D
var destroying = false;
func _ready():
	animated_sprite.play("default")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):

	if not destroying:
		velocity.x =  bullet_direction.x * _delta * 150
		move_and_slide()
	
func _physics_process(delta):
	pass

	
func destroy():
	destroying = true
	velocity.x = 0
	animated_sprite.play('explosion')
	await get_tree().create_timer(1.0).timeout
	self.free()
