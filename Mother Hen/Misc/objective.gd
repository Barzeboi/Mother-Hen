extends Area2D

var health = 1000
# Called when the node enters the scene tree for the first time.
func _process(delta):
	print(health)


func _take_damage(area):
	health -= area.damage
	if health <= 0:
		queue_free()
