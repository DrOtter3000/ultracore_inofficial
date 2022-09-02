extends KinematicBody2D


export (PackedScene) var Shit
const SPEED = 1000
const MAX_SPEED = 1000
var movement = Vector2.ZERO
var shitstatus = 0
var maximal_shit_depot = 500
var score = 0


func _physics_process(delta):
	update_gui()
	check_input()
	check_direction()
	move_and_slide(movement)


func game_over():
	print("Game Over")

func update_score():
	score += 1


func update_gui():
	get_tree().call_group("GUI", "update_shitometer", shitstatus, maximal_shit_depot)
	get_tree().call_group("GUI", "update_scores", score)


func check_input():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		movement.x = move_toward(0, MAX_SPEED, -SPEED)
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		movement.x = move_toward(0, MAX_SPEED, SPEED)
	else:
		movement.x = 0
	
	if Input.is_action_just_pressed("shit") and shitstatus == maximal_shit_depot:
		release_the_shit()


func release_the_shit():
	shitstatus = 0
	var poo = Shit.instance()
	owner.add_child(poo)
	poo.transform = $ShitPosition.global_transform


func check_direction():
	if movement.x < 0:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false


func _on_ShitTimer_timeout():
	$ShitTimer.start()
	if shitstatus < maximal_shit_depot:
		shitstatus += 1

