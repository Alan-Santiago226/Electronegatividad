extends Node2D

var des1: bool = false
var des2: bool = false
var noble1: bool = false
var noble2: bool = false
var conteo: float = 0
var ele1: float = 0
var ele2: float = 0
var escala1: float = 0
var escala2: float = 0

func _ready():
	$Primer/Basura.hide()
	$Segundo/Basura2.hide()

func orden_vacio(nuevo_texto: String, nuevo_numero: float, desconocido: bool, noble: bool, sin: bool,sc: float, cat: int):
	if $Primer.text == "":
		$Primer.text = nuevo_texto
		if(desconocido == true):
			$Datos1.text = "Desconocido"
			des1 = true
		else:
			$Datos1.text = str(nuevo_numero)
		if(sin == true):
			$Datos1/Alerta.text = "Elemento Sintetico"
		elif(noble == true):
			$Datos1/Alerta.text = "Baja Reactividad"
			noble1 = true
		visualizar(true, cat, sc)
		$Primer/Label.hide()
		$Primer/Basura.show()
	
	elif $Segundo.text == "":
		$Segundo.text = nuevo_texto
		if(desconocido == true):
			$Datos2.text = "Desconocido"
			des2= true
		else:
			$Datos2.text = str(nuevo_numero)
		if(sin == true):
			$Datos2/Alerta.text = "Elemento Sintetico"
		elif(noble == true):
			$Datos2/Alerta.text = "Baja Reactividad"
			noble2 = true
		visualizar(false, cat, sc)
		$Segundo/Label.hide()
		$Segundo/Basura2.show()
	if($Primer.text != "" and $Segundo.text != ""):
		calculo_en(des1, des2, noble1, noble2)
		
func calculo_en(d1: bool, d2: bool, n1: bool, n2: bool):
	if(d1 == true or d2 == true):
		$VBoxContainer/Resultado.text = "Desconocido"
	elif(noble1 == true or noble2 == true):
		$VBoxContainer/Resultado.text = "Sin reaccion"
	else:
		ele1 = $Datos1.text.to_float()
		ele2 = $Datos2.text.to_float()
		print(ele1, ele2)
		if (ele1 >= ele2):
			conteo = ele1 - ele2
		else:
			conteo = ele2 - ele1
		print(conteo)
		clasificacion_enlace(conteo)

func clasificacion_enlace(cont: float):
	if(cont <= 0.4):
		$VBoxContainer/HBoxContainer/Total.text = str(cont)
		$VBoxContainer/Resultado.text = "Covalente no polar"
	elif(cont <= 1.6 && cont >= 0.5):
		$VBoxContainer/HBoxContainer/Total.text = str(cont)
		$VBoxContainer/Resultado.text = "Covalente polar"
	else:
		$VBoxContainer/HBoxContainer/Total.text = str(cont)
		$VBoxContainer/Resultado.text = "Ionico"

func visualizar(cat: bool, tipo: int, escala: float):
	var atomo: Sprite2D
	
	if cat:
		atomo = $Atomo1
	else:
		atomo = $Atomo2
	
	match tipo:
		1:
			atomo.texture = preload("res://Sprites/Atom1.png")
		2:
			atomo.texture = preload("res://Sprites/Atom2.png")
		3:
			atomo.texture = preload("res://Sprites/Atom3.png")
		4:
			atomo.texture = preload("res://Sprites/Atom4.png")
		5:
			atomo.texture = preload("res://Sprites/Atom5.png")
		6:
			atomo.texture = preload("res://Sprites/Atom6.png")
		7:
			atomo.texture = preload("res://Sprites/Atom7.png")
	
	atomo.scale = Vector2(escala,escala)

func _on_button_h_pressed():
	orden_vacio("Hidrogeno", 2.1, false, false, false,1.10, 1)

func _on_button_he_pressed():
	orden_vacio("Helio", 0, false, true, false, 1.09, 7)

func _on_button_li_pressed():
	orden_vacio("Litio", 1, false, false, false,1.20, 2)

func _on_button_be_pressed():
	orden_vacio("Berilio", 1.5, false, false, false,1.19, 3)

func _on_button_b_pressed():
	orden_vacio("Boro", 2.0, false, false, false,1.18, 4)

func _on_button_c_pressed():
	orden_vacio("Carbono", 2.5, false, false, false,1.17, 1)

func _on_button_n_pressed():
	orden_vacio("Nitrogeno", 3.0, false, false, false,1.16, 1)

func _on_button_o_pressed():
	orden_vacio("Oxigeno",3.5, false, false, false, 1.15, 1)

func _on_button_f_pressed():
	orden_vacio("Flour",4.0, false, false, false, 1.14, 6)

func _on_button_ne_pressed():
	orden_vacio("Neon",0, false, true, false, 1.13, 7)

func _on_button_na_pressed():
	orden_vacio("Sodio",0.9, false, false, false,1.30, 2)

func _on_button_mg_pressed():
	orden_vacio("Magnesio",1.2, false, false, false, 1.29, 3)

func _on_button_al_pressed():
	orden_vacio("Aluminio",1.5, false, false, false, 1.28, 5)

func _on_button_si_pressed():
	orden_vacio("Silicio",1.8, false, false, false, 1.27, 4)

func _on_button_p_pressed():
	orden_vacio("Fosforo",2.1, false, false, false, 1.26, 1)

func _on_button_s_pressed():
	orden_vacio("Azufre",2.5, false, false, false, 1.25, 1)

func _on_button_cl_pressed():
	orden_vacio("Cloro",3.0, false, false, false, 1.24, 6)

func _on_button_ar_pressed():
	orden_vacio("Argon",0, false, true, false, 1.23, 7)

func _on_button_k_pressed():
	orden_vacio("Potasio",0.8, false, false, false, 1.40, 2)

func _on_button_ca_pressed():
	orden_vacio("Calcio",1.0, false, false, false, 1.39, 3)

func _on_button_ga_pressed():
	orden_vacio("Galio",1.6, false, false, false, 1.38, 5)

func _on_button_ge_pressed():
	orden_vacio("Germanio",1.8, false, false, false, 1.37, 4)

func _on_button_as_pressed():
	orden_vacio("Arsenico",2.0, false, false, false, 1.36, 4)

func _on_button_se_pressed():
	orden_vacio("Selenio",2.4, false, false, false, 1.35, 1)

func _on_button_br_pressed():
	orden_vacio("Bromo",2.8, false, false, false, 1.34, 6)

func _on_button_kr_pressed():
	orden_vacio("Kripton",0, false, true, false, 1.33, 7)

func _on_button_rb_pressed():
	orden_vacio("Rubidio",0.8, false, false, false, 1.50, 2)

func _on_button_sr_pressed():
	orden_vacio("Estroncio",1.0, false, false, false, 1.49, 3)

func _on_button_in_pressed():
	orden_vacio("Indio",1.7, false, false, false, 1.48, 5)

func _on_button_sn_pressed():
	orden_vacio("Estaño",1.8, false, false, false, 1.47, 5)

func _on_button_sb_pressed():
	orden_vacio("Antimonio",1.9, false, false, false, 1.46, 4)

func _on_button_te_pressed():
	orden_vacio("Telurio",2.1, false, false, false, 1.45, 4)

func _on_button_i_pressed():
	orden_vacio("Yodo",2.5, false, false, false, 1.44, 6)

func _on_button_xe_pressed():
	orden_vacio("Xenon", 0, false, true, false, 1.43, 7)

func _on_button_cs_pressed():
	orden_vacio("Cesio",0.7, false, false, false, 1.60, 2)

func _on_button_ba_pressed():
	orden_vacio("Bario",0.9, false, false, false, 1.59, 3)

func _on_button_tl_pressed():
	orden_vacio("Talio",1.8, false, false, false, 1.58, 5)

func _on_button_pb_pressed():
	orden_vacio("Plomo",1.9, false, false, false, 1.57, 5)

func _on_button_bi_pressed():
	orden_vacio("Bismuto",1.9, false, false, false, 1.56, 5)

func _on_button_po_pressed():
	orden_vacio("Polonio",2.0, false, false, false, 1.55, 4)

func _on_button_at_pressed():
	orden_vacio("Astato",2.2, false, false, false, 1.54, 6)

func _on_button_rn_pressed():
	orden_vacio("Radon",0, false, true, false, 1.53, 7)

func _on_button_fr_pressed():
	orden_vacio("Francio",0.7, false, false, false, 1.7, 2)

func _on_button_ra_pressed():
	orden_vacio("Radio",0.9, false, false, false, 1.69, 3)

func _on_button_nh_pressed():
	orden_vacio("Nihonio", 0, true, false, true, 1.68, 5)

func _on_button_fl_pressed():
	orden_vacio("Flerovio", 0, true, false, true, 1.67, 5)

func _on_button_mc_pressed():
	orden_vacio("Moscovio",0, true, false, true, 1.66, 5)

func _on_button_lv_pressed():
	orden_vacio("Livermorio", 1.61, false, false, true, 1.65, 5)

func _on_button_ts_pressed():
	orden_vacio("Teneso",0, true, false, true, 1.64, 6)

func _on_button_og_pressed():
	orden_vacio("Oganeson",0, false, true, false, 1.63, 7)

func _on_basura_pressed():
	$Atomo1.texture = null
	$Primer.text = ""
	$Datos1.text = ""
	$Datos1/Alerta.text = ""
	$VBoxContainer/HBoxContainer/Total.text = "0.0"
	$VBoxContainer/Resultado.text = ""
	des1 = false
	noble1 = false
	$Primer/Basura.hide()
	$Primer/Label.show()

func _on_basura_2_pressed():
	$Atomo2. texture = null
	$Segundo.text = ""
	$Datos2.text = ""
	$Datos2/Alerta.text = ""
	$VBoxContainer/HBoxContainer/Total.text = "0.0"
	$VBoxContainer/Resultado.text = ""
	des2 = false
	noble2 = false
	$Segundo/Basura2.hide()
	$Segundo/Label.show()
