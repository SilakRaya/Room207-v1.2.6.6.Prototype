extends Node3D


func _on_body_entered(body):
	if body.is_in_group("jolina"):
		print("Player Has entered Bush")

func _on_body_exited(body):
	if body.is_in_group("jolina"):
		print("Player exited bush")
