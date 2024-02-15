extends Control

var rich_text_label : RichTextLabel
var rich_text_label_2 : RichTextLabel

var Principal = load("res://Scenes/Plano_1.tscn")

func _ready():
	rich_text_label = $VBoxBotones/Entrar/RichTextLabel
	rich_text_label_2 = $VBoxBotones/Salir/RichTextLabel
	# Establecer el texto inicial
	rich_text_label.text = ""
	rich_text_label_2.text = ""


func _on_entrar_mouse_entered():
	rich_text_label.text = "[wave amp=20 freq=3] > [/wave]"


func _on_entrar_mouse_exited():
	rich_text_label.text = ""
	


func _on_salir_mouse_entered():
	rich_text_label_2.text = "[wave amp=20 freq=3] > [/wave]"


func _on_salir_mouse_exited():
	rich_text_label_2.text = ""


func _on_entrar_pressed():
	get_tree().change_scene_to_packed(Principal)


func _on_salir_pressed():
	get_tree().quit()
