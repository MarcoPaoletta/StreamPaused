extends CanvasLayer

# playing state
var playing = true

# times music played
var music_played = 0

# main func
func _process(_delta):
	# key pressed
	if Input.is_action_just_pressed("play"):
		playing = !playing
		
	#playing
	if playing == true:
		$L.text = "Reproduciendo"
		$Music.stream_paused = false
		$PausarResumir.text = "Pausar"
		$Background.color = Color(0.34902, 0.462745, 0.462745)
		$BgL.modulate = Color(0, 0.384314, 0.54902)
		$BgL.text = "Fondo: Celeste"
		$Border.color = Color(0.031373, 0.682353, 0.654902)
		$Arrow.hide()
		
	# not playing
	if playing == false:
		$L.text = "Pausado"
		$Music.stream_paused = true
		$PausarResumir.text = "Resumir"
		$Background.color = Color(0.352941, 0.180392, 0.47451)
		$BgL.modulate = Color(0.560784, 0.196078, 0.713726)
		$BgL.text = "Fondo: Violeta"
		$Border.color = Color(0.403922, 0.031373, 0.682353)
		$Arrow.show()

# music finished
func _on_Music_finished():
	$Music.play()
	music_played += 1
	$Veces.text = "Veces reproucida hasta el final = " + str(music_played)
	
# buttons funcs
func _on_PausarResumir_pressed():
	playing = !playing
	
func _on_Inicio_pressed():
	$Music.stream_paused = false
	$Music.play()
