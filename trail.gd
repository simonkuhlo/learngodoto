class_name Trail
extends Line2D

@export var MAX_POINTS: int = 20
@onready var curve = Curve2D.new()

func _ready():
	clear_points()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	curve.add_point(get_parent().position)
	if curve.get_baked_points().size() > MAX_POINTS:
			curve.remove_point(0)
	var path = curve.tessellate(5, 100) #???
	points = path
	print(Engine.get_frames_per_second())
	
			
func stop() -> void:
	set_process(false)
	var tw := get_tree().create_tween()
	tw.tween_property(self, "modulate:a", 0.0, 3.0)
	await tw.finished
	queue_free()


