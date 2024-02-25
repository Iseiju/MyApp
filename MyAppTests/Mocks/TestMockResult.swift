//
//  TestMockResult.swift
//  MyAppTests
//
//  Created by Kenneth James Uy on 2/21/24.
//

@testable import MyApp

final class TestMockResult<T: Codable> {
	
	var result: Result<T, NetworkError>?
	
	func attempt(_ completion: (Result<T, NetworkError>) -> Void) {
		result.map(completion)
		result = nil
	}
}
