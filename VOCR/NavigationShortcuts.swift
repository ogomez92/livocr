//
//  Shortcuts.swift
//  FloTools
//
//  Created by Chi Kim on 2/3/19.
//  Copyright © 2019 Chi Kim. All rights reserved.
//

import Cocoa

struct NavigationShortcuts {
	
	let right = HotKey(key:.rightArrow, modifiers:[.command,.control])
	let left = HotKey(key:.leftArrow, modifiers:[.command,.control])
	let up = HotKey(key:.upArrow, modifiers:[.command,.control])
	let down = HotKey(key:.downArrow, modifiers:[.command,.control])
	let top = HotKey(key:.pageUp, modifiers:[.command,.control])
	let bottom = HotKey(key:.pageDown, modifiers:[.command,.control])
	let beginning = HotKey(key:.home, modifiers:[.command,.control])
	let end = HotKey(key:.end, modifiers:[.command,.control])
	let nextCharacter = HotKey(key:.rightArrow, modifiers:[.command,.shift,.control])
	let previousCharacter = HotKey(key:.leftArrow, modifiers:[.command,.shift,.control])
	let location = HotKey(key:.l, modifiers:[.command,.control])
	let exit = HotKey(key:.escape, modifiers:[])
	let save = HotKey(key:.s, modifiers:[.command,.shift, .control])

	init() {
		location.keyDownHandler = {
			liveMode=false
			Navigation.shared.location()
		}
		
		right.keyDownHandler = {
			liveMode=false
			Navigation.shared.right()
		}
		
		left.keyDownHandler = {
			liveMode=false
			Navigation.shared.left()
		}
		
		up.keyDownHandler = {
			liveMode=false
			Navigation.shared.up()
		}
		
		down.keyDownHandler = {
			liveMode=false
			Navigation.shared.down()
		}

		top.keyDownHandler = {
			liveMode=false
			Navigation.shared.top()
		}

		bottom.keyDownHandler = {
			liveMode=false
			Navigation.shared.bottom()
		}

		beginning.keyDownHandler = {
			liveMode=false
			Navigation.shared.beginning()
		}

		end.keyDownHandler = {
			liveMode=false
			Navigation.shared.end()
		}

		nextCharacter.keyDownHandler = {
			liveMode=false
			Navigation.shared.nextCharacter()
		}
		
		previousCharacter.keyDownHandler = {
			liveMode=false
			Navigation.shared.previousCharacter()
		}
		
		exit.keyDownHandler = {
			liveMode=false
			Accessibility.speak("Exit VOCR navigation.")
			Navigation.shared.navigationShortcuts = nil
		}
		
		save.keyDownHandler = {
			liveMode=false
			let savePanel = NSSavePanel()
			savePanel.allowedFileTypes = ["txt"]
			savePanel.allowsOtherFileTypes = false
			savePanel.begin { (result) in
				if result.rawValue == NSApplication.ModalResponse.OK.rawValue {
					if let url = savePanel.url {
						var text = Navigation.shared.text()

						try! text.write(to: url, atomically: false, encoding: .utf8)
					}
					
				}
				let windows = NSApplication.shared.windows
				NSApplication.shared.hide(nil)
				windows[1].close()
			}
		}

	}

}

