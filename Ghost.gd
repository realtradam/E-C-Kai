extends KinematicBody2D


var position_record
var position_num = 0


func initialize(position_record):
	self.position_record = position_record


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if position_num < position_record.size():
		position = position_record[position_num]
		position_num += 1
	else:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
