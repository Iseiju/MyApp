//
//  NetworkMockResult.swift
//  MyAppTests
//
//  Created by Kenneth James Uy on 12/5/23.
//

@testable import MyApp

final class NetworkMockResult<T> {
	
	var result: Result<T, NetworkError>?
	
	func attempt(_ completion: (Result<T, NetworkError>) -> Void) {
		result.map(completion)
		result = nil
	}
}
