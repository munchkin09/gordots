class_name Item extends Node2D

@onready var collision :CollisionPolygon2D = $CollisionPolygon2D
@onready var item_collision :CollisionPolygon2D = $ItemDropped

@onready var sprite :Sprite2D = $Sprite2D
@onready var damage = 100
@export var weapon_owner : Node2D 

func activate():
	pass
