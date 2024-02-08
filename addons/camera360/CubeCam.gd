extends Node3D

@export var cube_size:float = 512: get = get_cube_size, set = set_cube_size
@export var shadow_atlast_size:float = 1024: get = get_shadow_atlas_size, set = set_shadow_atlas_size
@export var near:float = 0.1: get = get_near, set = set_near
@export var far:float = 300.0: get = get_far, set = set_far

var is_ready = false

func get_forward_texture():
	return $ForwardViewport.get_texture()

func get_left_texture():
	return $LeftViewport.get_texture()

func get_back_texture():
	return $BackViewport.get_texture()

func get_right_texture():
	return $RightViewport.get_texture()

func get_top_texture():
	return $TopViewport.get_texture()

func get_bottom_texture():
	return $BottomViewport.get_texture()

func set_cube_size(p_new_value):
	cube_size = p_new_value
	if is_ready:
		$ForwardViewport.size = Vector2(cube_size, cube_size)
		$LeftViewport.size = Vector2(cube_size, cube_size)
		$BackViewport.size = Vector2(cube_size, cube_size)
		$RightViewport.size = Vector2(cube_size, cube_size)
		$TopViewport.size = Vector2(cube_size, cube_size)
		$BottomViewport.size = Vector2(cube_size, cube_size)

func get_cube_size():
	return cube_size

func set_shadow_atlas_size(p_new_value):
	shadow_atlast_size = p_new_value
	if is_ready:
		$ForwardViewport.positional_shadow_atlas_size = shadow_atlast_size
		$LeftViewport.positional_shadow_atlas_size = shadow_atlast_size
		$BackViewport.positional_shadow_atlas_size = shadow_atlast_size
		$RightViewport.positional_shadow_atlas_size = shadow_atlast_size
		$TopViewport.positional_shadow_atlas_size = shadow_atlast_size
		$BottomViewport.positional_shadow_atlas_size = shadow_atlast_size

func get_shadow_atlas_size():
	return shadow_atlast_size

func set_near(p_new_value):
	near = p_new_value
	if is_ready:
		$ForwardViewport/Position/Camera3D.near = near
		$LeftViewport/Position/Camera3D.near = near
		$BackViewport/Position/Camera3D.near = near
		$RightViewport/Position/Camera3D.near = near
		$TopViewport/Position/Camera3D.near = near
		$BottomViewport/Position/Camera3D.near = near

func get_near():
	return near

func set_far(p_new_value):
	far = p_new_value
	if is_ready:
		$ForwardViewport/Position/Camera3D.far = far
		$LeftViewport/Position/Camera3D.far = far
		$BackViewport/Position/Camera3D.far = far
		$RightViewport/Position/Camera3D.far = far
		$TopViewport/Position/Camera3D.far = far
		$BottomViewport/Position/Camera3D.far = far

func get_far():
	return far

# Called when the node enters the scene tree for the first time.
func _ready():
	# now we're ready
	is_ready = true
	
	# and we can set our starting resolution
	set_cube_size(cube_size)
	set_shadow_atlas_size(shadow_atlast_size)
	set_near(near)
	set_far(far)

func _process(delta):
	var t = global_transform
	$ForwardViewport/Position.global_transform = t
	$LeftViewport/Position.global_transform = t
	$BackViewport/Position.global_transform = t
	$RightViewport/Position.global_transform = t
	$TopViewport/Position.global_transform = t
	$BottomViewport/Position.global_transform = t
