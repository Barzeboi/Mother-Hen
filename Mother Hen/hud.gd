extends CanvasLayer

var score

func _process(delta):
	score = Global.Mones
	$Count.text = str(score)


