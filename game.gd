extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var brick = preload("res://brick.tscn")
	var brickx = 0
	var bricky = 0
	var ball = get_node("ball")
	for i in range(3):
		if brickx > 0: 
			brickx = 0
		var instance = brick.instantiate()
		instance.position.x = brickx
		instance.position.y = bricky 
		add_child(instance)
		instance.broke.connect(ball._on_brick_broke)
		for z in range(4):
			brickx += 144
			instance = brick.instantiate()
			instance.position.x = brickx
			instance.position.y = bricky
			add_child(instance)
			instance.broke.connect(ball._on_brick_broke)
		bricky += 100
		
	#brick.broke.connect(ball._on_brick_broke)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var ball = get_node("ball")
	if ball.position.y > 400:
		get_tree().change_scene_to_file("res://loseScreen.tscn")
