//
//  NetworkDummy.swift
//  MyAppTests
//
//  Created by Kenneth James Uy on 12/5/23.
//

@testable import MyApp

final class NetworkDummy: NetworkTask {
	
	func resume() {}
	func suspend() {}
	func cancel() {}
}
