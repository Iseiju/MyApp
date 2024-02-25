//
//  TestAPIMock.swift
//  MyAppTests
//
//  Created by Kenneth James Uy on 2/21/24.
//

import Foundation
@testable import MyApp

final class TestAPIMock: PokemonAPIProtocol {
	
	let getPokemonResult = NetworkMockResult<[Pokemon]>()
	
	func getPokemons(
		result: @escaping (Result<[Pokemon], NetworkError>) -> Void
	) -> NetworkTask {
		getPokemonResult.attempt(result)
		return NetworkDummy()
	}
}
