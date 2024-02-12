extends Node3D

func on_resize():
	$Panorama.size = get_viewport().size;

# Called when the node enters the scene tree for the first time.
func _ready():
	# disable 3d output on our main viewport
	var vp = get_viewport()
	vp.disable_3d = true
	#vp.usage = SubViewport.USAGE_2D
	#vp.hdr = false
	
	# bind our camera images to our panorama render
	$Panorama.set_from_cubemap($Path3D/PathFollow3D/CubeCam)
	
	# connect to our window resize signal
	get_tree().get_root().connect("size_changed", Callable(self, "on_resize"))
	
	# init our size
	on_resize();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Path3D/PathFollow3D.progress += delta
	
	pass
