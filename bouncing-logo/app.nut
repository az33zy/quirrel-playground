from "%darg/ui_imports.nut"
import *

let cursor = require("cursor.nut")
let background = require("background.nut")
let logo = require("logo.nut")
let button = require("button.nut")

let logos = Watched([logo({})])

function appendChild() {
	logos([].extend(logos.value, [logo({})]))
}

function resetChildren() {
	logos([].extend([logo({})]))
}

return {
	cursor
	children = [
		background
		@() {
			watch = logos
			children = logos.value
		}
		@() {
			flow = FLOW_HORIZONTAL
			padding = sw(1)
			gap = sw(1)
			children = [
				button({
					text = "+ Add",
					onClick = appendChild
				})
				@() {
					children = [logos.value.len() > 1 ? button({
						text = "Reset",
						onClick = resetChildren
					}) : null], watch = logos
				}
			]
		}
	]
}