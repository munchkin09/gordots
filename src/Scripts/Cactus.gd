class_name Cactus extends Enemy

@onready var animation = $AnimatedSprite2D
@export var bullet: PackedScene 
@onready var life = 110
@onready var enemy_death_explosion :CPUParticles2D = $DeathCPUParticles2D
@onready var impact_sound :AudioStreamPlayer2D = $ImpactAudioStreamPlayer2D
@onready var death_sound :AudioStreamPlayer2D = $DeathAudioStreamPlayer2D
@onready var label = $Label
@onready var state_machine = $CactusStateMachine

func _ready():
	for child in get_children(true):
		if child.name == 'CactusStateMachine':
			child._set('player_node', character)
			child._set('bullet_node', bullet)
			child._set('cactus_node', self)

func _process(_delta):
	label.text = str(self.velocity) + "\n" + str(self.state_machine.current_state.name)

func receive_hit(damage):
	life -= damage
	LogDuck.w(life)
	if life <= 0:
		death_sound.play()
		enemy_death_explosion.restart()
		return
	impact_sound.play()
		

func _on_death_cpu_particles_2d_finished():
	queue_free()
