extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var node: Node3D = $Label3D
	var safe_script: SafeGDScript = node.get_script()
	print(safe_script.source_code)
	for d in safe_script.get_script_method_list():
		print(d)
	print("Some incrementing function: %s" % node.some_function())
	print("Meaning of life %s" % node.meaning_of_life())
	print("Meaning of myself: %s" % node.meaning_of_this())

	var sandbox: Sandbox = Sandbox.new()
	var load_buffer: FileAccess = FileAccess.open("res://addons/godot_sandbox/gdscript.elf", FileAccess.READ)
	sandbox.load_buffer(load_buffer.get_buffer(load_buffer.get_length()))
	var result_buffer: PackedByteArray = sandbox.vmcall("compile", safe_script.source_code)
	print("result_buffer %s bytes" % result_buffer.size())
	var result_file_access: FileAccess =  FileAccess.open("res://result_buffer.elf", FileAccess.WRITE)
	result_file_access.store_buffer(result_buffer)
	result_file_access.flush()
