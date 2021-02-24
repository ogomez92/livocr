import Cocoa
var liveSettings=[0,0,0,0]
struct Settings {
	static var positionReset = true
	static var positionalAudio = false


	static func load() {
		let defaults = UserDefaults.standard
		if let positionReset = defaults.object(forKey:"positionReset") {
			Settings.positionReset = defaults.bool(forKey:"positionReset")
		}
		debugPrint("positionReset \(Settings.positionReset)")
		Settings.positionalAudio = defaults.bool(forKey:"positionalAudio")
		debugPrint("positionalAudio \(Settings.positionalAudio)")
	}
	
	static func save() {
		let defaults = UserDefaults.standard
		defaults.set(Settings.positionReset, forKey:"positionReset")
		defaults.set(Settings.positionalAudio, forKey:"positionalAudio")
	}
	

}

class Ring {
	var options: [Option]=[]
	var cursor = -1
	init() {
		options.append(Option(tag: 0,name: "Crop from Top Edge",after: "Percent"))
		options.append(Option(tag: 1,name: "Crop from Bottom Edge",after: "Percent"))
		options.append(Option(tag: 2,name: "Crop from Right Edge",after: "Percent"))
		options.append(Option(tag: 3,name: "Crop from Left Edge",after: "Percent"))
	}
 func relocate(_ direction: Int) {
		if cursor == -1 {
			if direction == 1 { cursor=0 }
			if direction == -1 { cursor=options.count-1 }
		}
		cursor+=direction
		if cursor<0 { cursor=options.count-1 }
			if  cursor>=options.count { cursor=0 }
		
	}
 		func up() {
				if cursor == -1 { cursor = 0 }
				var value=options[cursor].value
				value+=5
				if value > 100 { value=100 }
				liveSettings[cursor]=value
				options[cursor].speak()
	}
 func down() {
			if cursor == -1 { cursor = 0 }
			var value=options[cursor].value
			value-=5
			if value < 0 { value=0 }
			liveSettings[cursor]=value
			options[cursor].speak()
		}
	
 func right() {
		relocate(1)
		options[cursor].speak()
	}
 func left() {
		relocate(-1)
		options[cursor].speak()
	}
	
}
struct Option {
	let tag: Int
	let name: String
	var value: Int=0 
	let after: String
	mutating func speak() {
		value=liveSettings[tag]
		Accessibility.speak("\(name) \(value) \(after)")
	}
}
