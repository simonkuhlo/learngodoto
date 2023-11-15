extends Node2D

@export var bullet: PackedScene 
@export var fire_rate_time: float = 0.1

@onready var bullet_spawn = $bullet_spawn
@onready var fire_rate = $fire_rate


# Called when the node enters the scene tree for the first time.

func shoot():
	if fire_rate.time_left == 0:
		fire_rate.start(fire_rate_time)
		var b = bullet.instantiate()
		b.transform = bullet_spawn.global_transform
		get_tree().root.get_child(0).add_child(b)
		

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("shoot"):
		shoot()
