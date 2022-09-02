extends KinematicBody2D


export (PackedScene) var Stick
const UP = Vector2(0, 1)
var speed = 100
var movement = Vector2(speed, 0)


func _process(delta):
	check_direction()
	check_for_wall()
	move_and_slide(movement, UP)


func throw():
	var b = Stick.instance()
	owner.add_child(b)
	b.transform = $Arm.global_transform

func check_for_wall():
	if is_on_wall():
		movement.x *= -1


func check_direction():
	if movement.x > 0:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false


func hurt():
	print("sound")
	get_tree().call_group("Player", "update_score")


func _on_ThrowTimer_timeout():
	$ThrowTimer.start()
	throw()
	
