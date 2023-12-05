extends CanvasLayer

class_name UI

@onready var lives_label = %LivesLabel
@onready var game_lost_container = $GameLostContainer
@onready var level_won_container = $LevelWonContainer

@onready var lose_sound = $LostSound
@onready var nex_level_two = $LevelPassSound
@onready var win_sound = $WinSound

func set_lives(lives: int):
	lives_label.text = "Lives: %d" % lives
	
func  game_over():
	game_lost_container.show()
	$LostSound.play()
	
func _on_game_lost_button_pressed():
	get_tree().reload_current_scene()

func on_level_won():
	if LevelDefinitions.current_level == 3:
		$WinSound.play()
	else:
		level_won_container.show()
		$LevelPassSound.play()
	
func _on_level_won_button_pressed():
	LevelDefinitions.current_level += 1
	get_tree().reload_current_scene()
	
