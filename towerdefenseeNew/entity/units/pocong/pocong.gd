extends CharacterBody2D

@export var speed = 50;

@export var max_hp = 500;
@export var current_hp = 500;

@onready var health_bar: ProgressBar = $HealthBar;
@onready var health_ratio = current_hp / max_hp;

@onready var player: Node2D = get_tree().get_root().get_node("Scene/Icon");
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D;

func makepath() -> void:
	nav_agent.target_position = player.global_position

func _physics_process(_delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized();
	velocity = dir * speed;
	move_and_slide();

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health_bar.max_value = max_hp;
	health_bar.value = current_hp;
	makepath();
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	health_bar.value = current_hp;	
	var r = abs(health_ratio - 1.0)
	var g = health_ratio
	var b = 0.0
	health_bar.get("theme_override_styles/fill").bg_color = Color(r, g, b)
	
	if (current_hp < 0):
		queue_free();
