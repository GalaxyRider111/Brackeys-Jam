extends Control

@export var text: String
@export var fontSize: int
@onready var label=$Text
@onready var timer=$Hide


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text=text
	#label.add_theme_font_size_override("font_size", fontSize)


func _on_hide_timeout() -> void:
	label.hide()
