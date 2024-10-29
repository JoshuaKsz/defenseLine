extends Node2D

@export
var cam_speed: float;

var atas: bool = false;
var bawah: bool = false;
var kiri: bool = false;
var kanan: bool = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_GUI(delta);
	pass

func move_GUI(delta: float) -> void:
	if (atas):
		position.y -= delta * 100 * cam_speed;
	if (bawah):
		position.y += delta * 100 * cam_speed;
		
	if (kiri):
		position.x -= delta * 100 * cam_speed;
		
	if (kanan):
		position.x += delta * 100 * cam_speed;
		
	pass

func _on_cam_atas_mouse_entered() -> void:
	atas = true;
	pass # Replace with function body.

func _on_cam_atas_mouse_exited() -> void:
	atas = false;
	pass # Replace with function body.

func _on_cam_bawah_mouse_entered() -> void:
	bawah = true;
	pass # Replace with function body.

func _on_cam_bawah_mouse_exited() -> void:
	bawah = false;
	pass # Replace with function body.

func _on_cam_kiri_mouse_entered() -> void:
	kiri = true;
	pass # Replace with function body.

func _on_cam_kiri_mouse_exited() -> void:
	kiri = false;
	pass # Replace with function body.

func _on_cam_kanan_mouse_entered() -> void:
	kanan = true
	pass # Replace with function body.

func _on_cam_kanan_mouse_exited() -> void:
	kanan = false;
	pass # Replace with function body.
