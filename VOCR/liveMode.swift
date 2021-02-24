//
//  liveMode.swift
//  VOCR
//
//  Created by oriol gomez Sentis on 21/1/21.
//  Copyright © 2021 Chi Kim. All rights reserved.
//

import Foundation

var liveMode=false
func setupLive() {
	if liveMode {
		settingsShortcuts=SettingsShortcuts()
	}
	else {
		settingsShortcuts=nil
	}
}
var settingsShortcuts: SettingsShortcuts?
class Live {

	var recognizedLines: [String]=[]
	var timer: Timer?
	init() {
		recognizedLines=[]
	}
	func start() {
		timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
		if !liveMode {
			return
		}
		if let  cgImage = TakeScreensShots() {
			Navigation.shared.startOCR(cgImage:cgImage)
		}
	}
	}
}
let live = Live()

