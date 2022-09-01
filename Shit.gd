extends Area2D


var speed = 750


func _physics_process(delta):
	position += transform.y * speed * delta


func _on_Shit_body_entered(body):
	if body.is_in_group("Giraffe"):
		body.hurt()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
