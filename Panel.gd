extends Panel

onready var dialog_text = $DialogText
var first_text_shown = false
var second_text_shown = false
var dialog_text_count = 0

signal dialog_finished

var storymode = {
	"entry_scene": {
		"first_text": "",
		"second_text": ""
	},
	"fight_scene": {
		"first_text": "",
		"second_text": "",
	}
}

func _process(delta: float) -> void:
	if first_text_shown == true and second_text_shown == false:
		if Input.is_action_just_pressed("ui_down"):
			add_storymode_text("entry_scene", "second_text", "This is the second text entryscene")
	
func _on_Tween_tween_completed(object: Object, key: NodePath) -> void:
	dialog_text.start_typewrite()

func change_dialog_text(text):
	dialog_text.text =  text
	
func start_dialog():
	$Tween.interpolate_property(self, "rect_position", Vector2(230,800), Vector2(230, 603), 2.0, Tween.TRANS_EXPO, Tween.EASE_IN_OUT)
	$Tween.start()

func close_dialog():
	$FinishedDialog.interpolate_property(self, "rect_position", Vector2(230,603), Vector2(230, 800), Tween.TRANS_EXPO, Tween.EASE_OUT_IN)
	$FinishedDialog.start()
	
func add_storymode_text(story_scene, text_level, text):
	var current_scene = storymode.get(story_scene)
	current_scene[text_level] = text

	if text_level == "first_text":
		dialog_text.text = current_scene[text_level]
		first_text_shown = true
		
		
	if text_level == "second_text" and first_text_shown == true:
		dialog_text.text = ""
		dialog_text.text = current_scene[text_level]
		dialog_text.start_typewrite()
		second_text_shown = true
	
	if second_text_shown == true and first_text_shown == true:
		print(first_text_shown, second_text_shown)
		emit_signal("dialog_finished")
		
func _on_Panel_dialog_finished() -> void:
	print("close dialog")
	close_dialog()
