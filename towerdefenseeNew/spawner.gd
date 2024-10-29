extends Node2D

var pocong = preload("res://entity/units/pocong/enemy_pocong.tscn")

var i : int = 0;
func _ready():
	#$Timer.connect("timeout", self, "_on_timer_timeout")
	$Timer.start() 
	var instance = pocong.instantiate()
	#instance.name = "enemy"
	instance.global_position = Vector2(-997, -167);
	add_child(instance)
	

	pass 


func _process(delta):
	pass


func _on_timer_timeout():
	var instance = pocong.instantiate()
	instance.name = "enemy_pocong" + str(i)
	i = i + 1;
	add_child(instance)
	
	pass 
	
	
func spawn_enemy(position: Vector2):
	var instance = pocong.instantiate()
	instance.name = "enemy_pocong" + str(i)
	i = i + 1;
	instance.global_position = position
	add_child(instance)
