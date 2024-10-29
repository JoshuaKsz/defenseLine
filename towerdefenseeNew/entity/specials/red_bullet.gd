extends CharacterBody2D

var target;
var speed = 50;
var pathName = "";
var bulletDamage;

func _physics_process(delta: float) -> void:
	var pathSpawnerNode = get_tree().get_root().get_node("Scene/test");
	for i in pathSpawnerNode.get_child_count():
		#if pathSpawnerNode.get_child(i).name == pathName:
		target = pathSpawnerNode.get_child(i).global_position;
	
	if (target):
		velocity = global_position.direction_to(target) * speed;
		look_at(target);
	
	move_and_slide();
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if "enemy_pocong" in body.name:
		body.current_hp -= bulletDamage
		queue_free();
	pass # Replace with function body.
