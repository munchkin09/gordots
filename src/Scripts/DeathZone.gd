class_name DeathZone extends Area2D

signal character_on_death_zone

func _on_body_entered(body):
	character_on_death_zone.emit()
