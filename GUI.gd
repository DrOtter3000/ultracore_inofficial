extends CanvasLayer


func update_shitometer(act_shit, max_shit):
	$TextureRect/Shitbox/TextureProgress.value = act_shit
	$TextureRect/Shitbox/TextureProgress.max_value = max_shit


func update_scores(act_score):
	$TextureRect/HBoxContainer/LblActScore.text = str(act_score)
