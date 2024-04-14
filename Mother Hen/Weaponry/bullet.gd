extends Area2D

signal hit
var speed = 1000
var damage = 20

func _physics_process(delta):
	position += transform.x * speed * delta
	

func _on_timer_timeout():
	queue_free()


func _on_area_entered(area):
	if area.is_in_group("Enemies"):
		area.health -= damage
	queue_free()
	
