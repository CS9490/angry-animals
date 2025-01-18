extends TextureButton

const HOVER_SCALE: Vector2 = Vector2(1.1,1.1)
const DEFAULT_SCALE: Vector2 = Vector2(1.0, 1.0)

@export var level_number: int = 1

@onready var level_label = $MC/VBoxContainer/LevelLabel
@onready var score_label = $MC/VBoxContainer/ScoreLabel


var _level_scene: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	_level_scene = load("res://scenes/level/level%s.tscn" % level_number)
	var best_sc = ScoreManager.get_best_for_level(str(level_number))
	score_label.text = str(best_sc)
	level_label.text = "%s" % level_number

#func _process(delta: float) -> void:
	#if is_hovered() and scale != HOVER_SCALE:
		#scale = HOVER_SCALE
	#elif is_hovered() == false and scale == HOVER_SCALE: 
		#scale = DEFAULT_SCALE
# ^ this is a more computationally intensive, but it's just to show an example

func _on_pressed():
	ScoreManager.set_level_selected(level_number)
	get_tree().change_scene_to_packed(_level_scene)


func _on_mouse_entered():
	scale = HOVER_SCALE


func _on_mouse_exited():
	scale = DEFAULT_SCALE
