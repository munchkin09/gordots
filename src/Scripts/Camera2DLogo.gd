extends Camera2D
var startZooming = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(startZooming && self.zoom >= Vector2(-1,-1)):
		var actualZoom = self.zoom
		self.zoom = Vector2(actualZoom.x + (-0.4 * _delta), actualZoom.y + (-0.4 * _delta))
	else:
		startZooming = false
