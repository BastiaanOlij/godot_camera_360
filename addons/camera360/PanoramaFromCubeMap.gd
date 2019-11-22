extends ColorRect

export (Texture) var ForwardTexture setget set_forward_texture, get_forward_texture
export (Texture) var LeftTexture setget set_left_texture, get_left_texture
export (Texture) var BackTexture setget set_back_texture, get_back_texture
export (Texture) var RightTexture setget set_right_texture, get_right_texture
export (Texture) var TopTexture setget set_top_texture, get_top_texture
export (Texture) var BottomTexture setget set_bottom_texture, get_bottom_texture

var is_ready = false

func set_from_cubemap(cubemap):
	set_forward_texture(cubemap.get_forward_texture())
	set_left_texture(cubemap.get_left_texture())
	set_back_texture(cubemap.get_back_texture())
	set_right_texture(cubemap.get_right_texture())
	set_top_texture(cubemap.get_top_texture())
	set_bottom_texture(cubemap.get_bottom_texture())

func set_forward_texture(new_texture : Texture):
	ForwardTexture = new_texture
	if is_ready:
		material.set_shader_param('ForwardTexture', ForwardTexture)

func get_forward_texture():
	return ForwardTexture

func set_left_texture(new_texture : Texture):
	LeftTexture = new_texture
	if is_ready:
		material.set_shader_param('LeftTexture', LeftTexture)

func get_left_texture():
	return LeftTexture

func set_back_texture(new_texture : Texture):
	BackTexture = new_texture
	if is_ready:
		material.set_shader_param('BackTexture', BackTexture)

func get_back_texture():
	return BackTexture

func set_right_texture(new_texture : Texture):
	RightTexture = new_texture
	if is_ready:
		material.set_shader_param('RightTexture', RightTexture)

func get_right_texture():
	return RightTexture

func set_top_texture(new_texture : Texture):
	TopTexture = new_texture
	if is_ready:
		material.set_shader_param('TopTexture', TopTexture)

func get_top_texture():
	return TopTexture

func set_bottom_texture(new_texture : Texture):
	BottomTexture = new_texture
	if is_ready:
		material.set_shader_param('BottomTexture', BottomTexture)

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

