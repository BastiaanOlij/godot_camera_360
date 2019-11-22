extends Spatial

func on_resize():
	$Panorama.rect_size = get_viewport().size;

# Called when the node enters the scene tree for the first time.
func _ready():
	# disable 3d output on our main viewport
	var vp = get_viewport()
	vp.disable_3d = true
	vp.usage = Viewport.USAGE_2D
	vp.hdr = false
	
	# bind our camera images to our panorama render
	$Panorama.set_from_cubemap($Path/PathFollow/CubeCam)
	
	# connect to our window resize signal
	get_tree().get_root().connect("size_changed", self, "on_resize")
	
	# init our size
	on_resize();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Path/PathFollow.offset += delta
	
	pass
