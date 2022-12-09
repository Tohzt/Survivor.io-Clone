extends Button
signal select

var dynamic_font: DynamicFont

func _ready():
	dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://Game/Assets/Font.ttf")
	dynamic_font.size = 40
	self.set("custom_fonts/font", dynamic_font)

func on_select():
	emit_signal("select", self.name)
