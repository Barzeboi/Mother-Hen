extends Node2D




func _on_retreat(body): # Connects the EscapeArea to the World script
	body.queue_free()

func _process(delta):
	if $Playercharacter.is_ded == true:
		$GameOver.visible = true
		get_tree().set_deferred("paused", true)
		
