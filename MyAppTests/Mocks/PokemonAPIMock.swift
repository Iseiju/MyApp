//
//  PokemonAPIMock.swift
//  MyAppTests
//
//  Created by Kenneth James Uy on 12/5/23.
//

@testable import MyApp

final class PokemonAPIMock: PokemonAPIProtocol {
	
	var pokemonsResult = NetworkMockResult<[Pokemon]>()
	
	func getPokemons(
		result: @escaping (Result<[Pokemon], NetworkError>) -> Void
	) -> NetworkTask {
		pokemonsResult.attempt(result)
		return NetworkDummy()
	}
}
