//
//  NetworkTask.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/4/23.
//

import Foundation

protocol NetworkTask {

	func resume()
	func suspend()
	func cancel()
}

extension URLSessionDataTask: NetworkTask {}
