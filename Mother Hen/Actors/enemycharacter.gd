extends CharacterBody2D

signal hit
var speed = 175
var Rand1 
@export var health = 160
var damage = 10
@onready var player = get_node("/root/World/Playercharacter")
@onready var objective = get_node("/root/World/Objective")
@onready var bullet = preload("res://Weaponry/bullet.tscn")
@onready var retreat_area = get_node("/root/World/EscapeArea")
enum {
	OBJECTIVE,
	PLAYER,
	RETREATING
}
var state = RETREATING

func _ready():
	Rand1 = randi_range(1, 10)
	
func _physics_process(_delta):
	var direction
	if state == OBJECTIVE:
		direction = global_position.direction_to(objective.global_position)
		if direction == null:
			state = RETREATING
	if state == PLAYER:
		direction = global_position.direction_to(player.global_position)
	if state == RETREATING:
		direction = global_position.direction_to(retreat_area.global_position)
	velocity = speed * direction
	move_and_slide()

func take_damage(area):
	health -= area.damage
	if health <= 0:
		Global.Mones += randi() % 3 + 1
		queue_free()
	print(health)
		#Hud.score += 200
	
func _process(delta):
	print(Rand1)
	if health <= 40:
		state = RETREATING
	if Rand1 == 10:
		state = PLAYER
	elif Rand1 > 0 and Rand1 <= 9:
		state = OBJECTIVE

func _on_hit(area):
	speed *= 0
	hit.emit()
	$Hitbox/CollisionShape2D.set_deferred("disabled", true)
	$sleep.start()
	
func _on_sleep_timeout():
	speed = 175
	$Hitbox/CollisionShape2D.set_deferred("disabled", false)
