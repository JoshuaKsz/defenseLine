extends Panel

@onready var tower = preload("res://test.tscn");
var currTile


func _on_gui_input(event: InputEvent) -> void:
	var tempTower = tower.instantiate();
	if event is InputEventMouseButton and event.button_mask == 1:
		#left click down
		add_child(tempTower);
		tempTower.process_mode = Node.PROCESS_MODE_DISABLED;
	elif event is InputEventMouseMotion and event.button_mask == 1:
		#left click drag
		if get_child_count() > 1:
			get_child(1).global_position = event.global_position
		
		
	elif event is InputEventMouseButton and event.button_mask == 0:
		#left click up
		if get_child_count() > 1:
			get_child(1).queue_free();
		get_child(1).queue_free();
		
		var path = get_tree().get_root().get_node("Scene/towers");
		var GUIpos = get_tree().get_root().get_node("Scene/GUI");
		
		#event.global_position merupakan lokasi vektor viewportnya
		tempTower.global_position = GUIpos.position - Vector2(get_viewport().get_size().x/2, get_viewport().get_size().y/2) + event.global_position;
		path.add_child(tempTower);
		print("pos UI",tempTower.position);
		print("node pos",path.get_children()[0].position);
	else:
		if get_child_count() > 1:
			get_child(1).queue_free();
