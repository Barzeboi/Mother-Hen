extends CharacterBody2D

var health = 100.0
var speed = 125
var fire_rate = 5
var bullet = preload("res://Weaponry/bullet.tscn")
var update_delta = 1.0/ fire_rate
var current_time = 0.0
var is_ded = false


func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()

func _process(_delta: float) -> void:
	current_time += _delta
	if (current_time < update_delta):
		return
		
	if Input.is_action_pressed("shoot"):
		current_time = 0.0
		shoot()
		
	
func shoot():
	var b = bullet.instantiate()
	owner.add_child(b)
	b.transform = $Pivot/Reticle.global_transform


func take_damage(area):
	health -= area.damage
	if health <= 0:
		_ded()
		
		
func _ded():
	$Sprite2D.visible = false
	$CollisionShape2D.set_deferred("disabled", true)
	$Hurtbox/CollisionShape2D.set_deferred("disabled",true)
	is_ded = true
