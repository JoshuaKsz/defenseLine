extends Node2D

@onready var tilemap = $TileMap



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("ui_text_clear_carets_and_selection")):
		get_tree().quit();
	pass
	#var mouse :Vector2 = get_global_mouse_position()
	#var cell :Vector2 = tilemap.world_to_map(mouse)
	#var abc :int = tilemap.get_cellv(cell)
	#var new_abc :int = (abc + 1) % 3 # just an example plus 1 modules 3
	#tilemap.set_cellv(cell, new_abc)