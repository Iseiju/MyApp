//
//  Encodable+Dictionary.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/18/23.
//

import Foundation
import SampleFramework

extension Encodable {
	
	func toDictionary() -> [String : Any]? {
		let jsonEncoder = JSONEncoder()
		let jsonData = try? jsonEncoder.encode(self)
		
		return try? JSONSerialization.jsonObject(with: jsonData!, options: []) as? [String : Any]
	}
}

class MyClass: OpenClass {
	
	override var first: Int {
		get {
			return numberReturn()
		}
		
		set {
			var a = newValue
		}
	}
	
	func numberReturn() -> Int { return 1 }
}

enum SampleRawEnum: Int {
	
	case first = 0
	case second = 1
	case third = 2
}

enum SampleAssocEnum {
	
	case first(String)
	case second(Int)
	case third(Data)
}
