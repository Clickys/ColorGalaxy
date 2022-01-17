extends Panel

onready var dialog_text = $DialogText


var storymode = {
	"entry_scene": {
		"first_text": "",
		"second_text": ""
	},
	"fight_scene": {
		"first_text": ""
	}
}
func _ready() -> void:
	pass
#	start_dialog()
#	add_storymode_text("fight_scene", "first_text" , "this is the firs text")
	
func _on_Tween_tween_completed(object: Object, key: NodePath) -> void:
	dialog_text.start_typewrite()

func change_dialog_text(text):
	dialog_text.text =  text
	
func start_dialog():
	$Tween.interpolate_property(self, "rect_position", Vector2(230,800), Vector2(230, 603), 2.0, Tween.TRANS_EXPO, Tween.EASE_IN_OUT)
	$Tween.start()

func add_storymode_text(story_scene, text_level, text):
	var current_scene = storymode.get(story_scene)
	current_scene[text_level] = text

	if text_level == "first_text":
		dialog_text.text = current_scene[text_level]
	yield()
	
func _on_DialogTween_tween_completed(object: Object, key: NodePath) -> void:
	if Input.is_action_just_pressed("ui_down"):
		pass
