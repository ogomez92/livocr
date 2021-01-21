//
//  Shortcuts.swift
//  VOCR
//
//  Created by Chi Kim on 10/12/19.
//  Copyright © 2019 Chi Kim. All rights reserved.
//

import Cocoa

struct Shortcuts {
	
	let window = HotKey(key:.w, modifiers:[.command,.control,.shift])
	let liveKey = HotKey(key:.l, modifiers:[.command,.control,.shift])
	let vo = HotKey(key:.v, modifiers:[.command,.shift, .control])
	let resetPosition = HotKey(key:.r, modifiers:[.command,.shift, .control])
	let positionalAudio = HotKey(key:.p, modifiers:[.command,.shift, .control])
	
	init() {
		liveKey.keyDownHandler = {
			if !Accessibility.isTrusted(ask:true) {
				print("Accessibility not enabled.")
				return
			}
			liveMode.toggle()
			live.recognizedLines=[]
			
			if liveMode {
				Accessibility.speak("LIVOCR on")
							}
			if !liveMode {
				Accessibility.speak("LIVOCR off")
			}

		}
		

		window.keyDownHandler = {
			liveMode=false
			if !Accessibility.isTrusted(ask:true) {
				print("Accessibility not enabled.")
				return
			}
			
			if let  cgImage = TakeScreensShots() {
				Navigation.shared.startOCR(cgImage:cgImage)
			}
		}
		
		vo.keyDownHandler = {
			liveMode=false
			recognizeVOCursor()
		}
		
		resetPosition.keyDownHandler = {
			liveMode=false
			if Settings.positionReset {
				Settings.positionReset = false
				Accessibility.speak("Disable reset position.")
			} else {
				Settings.positionReset = true
				Accessibility.speak("Enable reset position.")
			}
			Settings.save()
		}
		
		positionalAudio.keyDownHandler = {
			liveMode=false
			if Settings.positionalAudio {
				Settings.positionalAudio = false
				Accessibility.speak("Disable positional audio.")
			} else {
				Settings.positionalAudio = true
				Accessibility.speak("Enable positional audio.")
			}
			Settings.save()
		}
		
	}
	
}

