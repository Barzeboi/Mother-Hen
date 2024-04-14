extends Marker2D

@export var spawn_scene = preload("res://Actors/enemycharacter.tscn")

func _ready():
	$spawn_timer.wait_time = randf_range(3.0, 8.0)
	$spawn_timer.start()

func _process(_delta):
	if Global.enemies_left == 0:
		$spawn_timer.stop()

func _on_spawn_timer_timeout():
	spawn()
	Global.enemies_left -= 1
	
func spawn():
	var s = spawn_scene.instantiate()
	owner.add_child(s)
	s.transform = self.global_transform

func wave_changed():
	$spawn_timer.start()
