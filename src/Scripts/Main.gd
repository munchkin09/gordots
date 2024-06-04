extends Node2D

var times_looped = 1
@onready var animation = $CanvasLayer/PanelContainer/AnimatedSprite2D

func _on_animated_sprite_2d_animation_looped():
	times_looped += 1
	if times_looped >= 1:
		GameStateMachine.startStateMachine(self)
		animation.stop()
		%AnimatedSprite2D.queue_free()
		%Sprite2D.queue_free()

