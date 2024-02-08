extends ColorRect

@export var ForwardTexture:Texture2D : get = get_forward_texture, set = set_forward_texture
@export var LeftTexture:Texture2D : get = get_left_texture, set = set_left_texture
@export var BackTexture:Texture2D : get = get_back_texture, set = set_back_texture
@export var RightTexture:Texture2D : get = get_right_texture, set = set_right_texture
@export var TopTexture:Texture2D : get = get_top_texture, set = set_top_texture
@export var BottomTexture:Texture2D : get = get_bottom_texture, set = set_bottom_texture

var is_ready = false

func set_from_cubemap(cubemap):
	set_forward_texture(cubemap.get_forward_texture())
	set_left_texture(cubemap.get_left_texture())
	set_back_texture(cubemap.get_back_texture())
	set_right_texture(cubemap.get_right_texture())
	set_top_texture(cubemap.get_top_texture())
	set_bottom_texture(cubemap.get_bottom_texture())

func set_forward_texture(new_texture : Texture2D):
	ForwardTexture = new_texture
	if is_ready:
		material.set_shader_parameter('ForwardTexture', ForwardTexture)

func get_forward_texture():
	return ForwardTexture

func set_left_texture(new_texture : Texture2D):
	LeftTexture = new_texture
	if is_ready:
		material.set_shader_parameter('LeftTexture', LeftTexture)

func get_left_texture():
	return LeftTexture

func set_back_texture(new_texture : Texture2D):
	BackTexture = new_texture
	if is_ready:
		material.set_shader_parameter('BackTexture', BackTexture)

func get_back_texture():
	return BackTexture

func set_right_texture(new_texture : Texture2D):
	RightTexture = new_texture
	if is_ready:
		material.set_shader_parameter('RightTexture', RightTexture)

func get_right_texture():
	return RightTexture

func set_top_texture(new_texture : Texture2D):
	TopTexture = new_texture
	if is_ready:
		material.set_shader_parameter('TopTexture', TopTexture)

func get_top_texture():
	return TopTexture

func set_bottom_texture(new_texture : Texture2D):
	BottomTexture = new_texture
	if is_ready:
		material.set_shader_parameter('BottomTexture', BottomTexture)

func get_bottom_texture():
	return BottomTexture

# Called when the node enters the scene tree for the first time.
func _ready():
	# we are ready
	is_ready = true
	
	# assign textures to shader
	set_forward_texture(ForwardTexture)
	set_left_texture(LeftTexture)
	set_back_texture(BackTexture)
	set_right_texture(RightTexture)
	set_top_texture(TopTexture)
	set_bottom_texture(BottomTexture)

