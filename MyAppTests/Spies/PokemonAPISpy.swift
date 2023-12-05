//
//  PokemonAPISpy.swift
//  MyAppTests
//
//  Created by Kenneth James Uy on 12/5/23.
//

@testable import MyApp
import Foundation

final class PokemonAPISpy: PokemonAPIProtocol {
	
	enum Method: Equatable {
		
		case getPokemons
	}
	
	var called: [Method] = []
	
	func getPokemons(
		result: @escaping (Result<[Pokemon], NetworkError>) -> Void
	) -> NetworkTask {
		called.append(.getPokemons)
		return NetworkDummy()
	}
}
