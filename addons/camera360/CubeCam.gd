extends Spatial

export var cube_size = 512 setget set_cube_size, get_cube_size
export var shadow_atlast_size = 1024 setget set_shadow_atlas_size, get_shadow_atlas_size
export var near = 0.1 setget set_near, get_near
export var far = 300.0 setget set_far, get_far

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
		$ForwardViewport.shadow_atlas_size = shadow_atlast_size
		$LeftViewport.shadow_atlas_size = shadow_atlast_size
		$BackViewport.shadow_atlas_size = shadow_atlast_size
		$RightViewport.shadow_atlas_size = shadow_atlast_size
		$TopViewport.shadow_atlas_size = shadow_atlast_size
		$BottomViewport.shadow_atlas_size = shadow_atlast_size

func get_shadow_atlas_size():
	return shadow_atlast_size

func set_near(p_new_value):
	near = p_new_value
	if is_ready:
		$ForwardViewport/Position/Camera.near = near
		$LeftViewport/Position/Camera.near = near
		$BackViewport/Position/Camera.near = near
		$RightViewport/Position/Camera.near = near
		$TopViewport/Position/Camera.near = near
		$BottomViewport/Position/Camera.near = near

func get_near():
	return near

func set_far(p_new_value):
	far = p_new_value
	if is_ready:
		$ForwardViewport/Position/Camera.far = far
		$LeftViewport/Position/Camera.far = far
		$BackViewport/Position/Camera.far = far
		$RightViewport/Position/Camera.far = far
		$TopViewport/Position/Camera.far = far
		$BottomViewport/Position/Camera.far = far

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
