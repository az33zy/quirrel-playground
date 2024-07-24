from "%darg/ui_imports.nut"
import *

function button(params) {
	let text = params?.text ?? ""
	let onClick = params?.onClick
	let onHover = params?.onHover

	return watchElemState(function(sf) {
		return {
			rendObj = ROBJ_BOX
			// size = [sh(20),SIZE_TO_CONTENT]
			padding = sh(2)
			pos = params?.pos
			fillColor = (sf & S_ACTIVE) ? Color(0, 0, 0) : Color(200, 200, 200)
			borderWidth = (sf & S_HOVER) ? 2 : 0
			behavior = [Behaviors.Button]
			onClick = onClick
			onHover = onHover
			hotkeys = params?.hotkeys
			children = {
				rendObj = ROBJ_TEXT text = text color = (sf & S_ACTIVE) ? Color(255, 255, 255) : Color(0, 0, 0) pos = (sf & S_ACTIVE) ? [0, 2] : [0, 0]
			}
		}
	})
}

return button