import Cocoa

struct SettingsShortcuts {

	let right = HotKey(key:.rightArrow, modifiers:[.command,.control])
	let left = HotKey(key:.leftArrow, modifiers:[.command,.control])
	let up = HotKey(key:.upArrow, modifiers:[.command,.control])
	let down = HotKey(key:.downArrow, modifiers:[.command,.control])
	
	init() {
		right.keyDownHandler = {
			Navigation.shared.ring.right()
		}
		
		left.keyDownHandler = {
			Navigation.shared.ring.left()
		}
		
		up.keyDownHandler = {
			Navigation.shared.ring.up()
		}
		
		down.keyDownHandler = {
			Navigation.shared.ring.down()
		}
		
		
		
	}
	
}


