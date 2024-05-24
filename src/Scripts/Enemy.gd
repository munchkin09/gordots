class_name Enemy extends CharacterBody2D

var logDuckHeader = '[Enemy]' + self.name

var Log = func(msg, arg1 = null, arg2 = null, arg3 = null, arg4 = null, arg5 = null, arg6 = null):
	LogDuck.d(logDuckHeader + msg, arg1, arg2, arg3, arg4, arg5, arg6)

@export var character: Character
@export var debug_lines: bool = false

var debug :Dictionary = 	{
	"velocity": velocity,
	"point": Vector2(4.0,4.0)
}

func _physics_process(_delta):
	if debug_lines:
		queue_redraw()

func _draw():
	if debug_lines:
		var distance_to_player = character.global_position - self.global_position
		draw_line(Vector2(0,0),distance_to_player, Color.BLACK,1.0)

