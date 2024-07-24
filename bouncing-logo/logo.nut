from "%darg/ui_imports.nut"
import *

let math = require("math")

let screenWidth = sw(100)
let screenHeight = sh(100)
let imageScale = 2
let imageWidth = 187 * imageScale
let imageHeight = 88 * imageScale
let image = Picture($"quirrel-playground/bouncing-logo/gaijin.svg:{imageWidth * 2}:{imageHeight * 2}")

function random(min, max) {
	return math.rand() * max / math.RAND_MAX + min
}

function randomColor() {
	let r = random(100, 256)
	let g = random(100, 256)
	let b = random(100, 256)
	return Color(r, g, b)
}

function logo(params) {
	let position = Watched({
		x = math.rand() % (screenWidth - imageWidth),
		y = math.rand() % (screenHeight - imageHeight)
	})
	let color = Watched(randomColor())
	let speed = {
		x = random(10, 20),
		y = random(10, 20)
	}

	function changeColor() {
		color(randomColor())
	}

	function move() {
		let pos = {
			x = position.value.x + speed.x,
			y = position.value.y + speed.y
		}

		if (pos.x + imageWidth > screenWidth || pos.x < 0) {
			speed.x = -speed.x
			changeColor()
		}

		if (pos.y + imageHeight > screenHeight || pos.y < 0) {
			speed.y = -speed.y
			changeColor()
		}

		position(pos)
	}

	return @() {
		key = {}
		rendObj = ROBJ_IMAGE
		size = [imageWidth, imageHeight]
		image
		color = color.value
		keepAspect = true
		// borderWidth=2.0
		pos = [position.value.x, position.value.y]
		watch = [position, color]
		onAttach = @() gui_scene.setInterval(1.0 / 60, move)
		onDetach = @() gui_scene.clearTimer(move)
	}
}

return logo