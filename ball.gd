extends CharacterBody2D


const SPEED = 1.0
var xdir = false
var ydir = false



func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if xdir == true:
		position.x += SPEED
	else: 
		position.x -= SPEED
		
	if ydir == true:
		position.y += SPEED
	else: 
		position.y -= SPEED

	if position.x == 0 or position.x == 576:
		xdir = not xdir
	
	if position.y == 0:
		ydir = not ydir

	move_and_slide()


func _on_brick_broke():
	xdir = not xdir
	ydir = not ydir


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	ydir = not ydir
