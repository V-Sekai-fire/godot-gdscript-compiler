extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var node: Node3D = $SafeScript
	var safe_script: SafeGDScript = node.get_script()
	print(safe_script.source_code)
	for d in safe_script.get_script_method_list():
		print(d)
	print("Some incrementing function: %s" % node.some_function())
	print("Meaning of life %s" % node.meaning_of_life())
	print("Meaning of myself: %s" % node.meaning_of_this(self))
