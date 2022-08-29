extends KinematicBody2D


const SPEED = 1000
const MAX_SPEED = 1000
var movement = Vector2.ZERO


func _physics_process(delta):
	check_input()
	check_direction()
	move_and_slide(movement)


func check_input():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		movement.x = move_toward(0, MAX_SPEED, -SPEED)
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		movement.x = move_toward(0, MAX_SPEED, SPEED)
	else:
		movement.x = 0


func check_direction():
	if movement.x < 0:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
