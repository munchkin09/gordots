class_name Level1_1TileMap extends TileMap

func _ready():
	GameStateMachine.changeTileMapBounds(getTileMapBounds())
	
func getTileMapBounds() -> Array[Vector2]:
	var bounds : Array[Vector2] = []
	bounds.append(
		Vector2(get_used_rect().position * rendering_quadrant_size)
	)	
	bounds.append(
		Vector2(get_used_rect().end * rendering_quadrant_size)
	)
	LogDuck.w(bounds)
	return bounds
