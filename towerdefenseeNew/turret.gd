extends StaticBody2D

var Bullet = preload("res://entity/specials/red_bullet.tscn")
var bulletDamage = 150
var currTargets = []
var curr = null
var shootCooldown = 0.4
var canShoot = true

func _process(delta: float) -> void:
	if canShoot and curr:
		look_at(-curr.global_position)
		shoot_bullet()
		canShoot = false

	# Handle cooldown
	if not canShoot:
		shootCooldown -= delta
		if shootCooldown <= 0:
			canShoot = true
			shootCooldown = 1.0  # Reset cooldown

func shoot_bullet():
	var tempBullet = Bullet.instantiate()
	tempBullet.bulletDamage = bulletDamage
	get_node("BulletContainer").add_child(tempBullet)
	tempBullet.global_position = $Aim.global_position
	print("Bullet shot at target: ", curr.name)

func _on_range_body_entered(body):
	print(body.name)
	if "enemy" in body.name:
		currTargets = get_node("Range").get_overlapping_bodies()
		curr = get_first_enemy_target(currTargets)

func _on_range_body_exited(body):
	currTargets = get_node("Range").get_overlapping_bodies()
	curr = get_first_enemy_target(currTargets)

func get_first_enemy_target(targets):
	for target in targets:
		if "enemy" in target.name:
			return target.get_node("../")  # Adjust according to your scene structure
	return null
