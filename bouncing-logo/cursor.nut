from "%darg/ui_imports.nut"
import *

return Cursor({
	rendObj = ROBJ_VECTOR_CANVAS
	size = [sh(2.5), sh(2.5)]
	commands = [
		[VECTOR_WIDTH, hdpx(1.4)],
		[VECTOR_FILL_COLOR, Color(10, 10, 10, 200)],
		[VECTOR_COLOR, Color(180, 180, 180, 100)],
		[VECTOR_POLY, 0, 0, 80, 65, 46, 65, 35, 100],
	]
})