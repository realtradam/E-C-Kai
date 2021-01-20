extends Node


var ghost = load("res://Ghost.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_died(position_record):
	var new_ghost = ghost.instance()
	new_ghost.initialize(position_record)
	add_child(new_ghost)
