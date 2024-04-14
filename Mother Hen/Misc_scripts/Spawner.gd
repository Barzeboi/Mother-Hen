extends Marker2D

@export var spawn_scene = preload("res://Actors/enemycharacter.tscn")

func ready():
	$Timer.wait_time = 4
	$Timer.start()

func _process(_delta):
	if Global.enemies_left == 0:
		$Timer.stop()

func _on_spawn_timer_timeout():
	spawn()
	Global.enemies_left -= 1
	
func spawn():
	var s = spawn_scene.instantiate()
	owner.add_child(s)
	s.transform = self.global_transform

func wave_changed():
	$Timer.start()
