//
//  PokemonAPI.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/4/23.
//

protocol PokemonAPIProtocol {
	
	@discardableResult
	func getPokemons(
		result: @escaping (Result<[Pokemon], NetworkError>) -> Void
	) -> NetworkTask
}

extension NetworkService: PokemonAPIProtocol {
	
	func getPokemons(
		result: @escaping (Result<[Pokemon], NetworkError>) -> Void
	) -> NetworkTask {
		let urlString = "https://pokeapi.co/api/v2/pokemon"
		
		return request(
			urlString: urlString,
			method: .get,
			type: APIResponse<[Pokemon]>.self) { apiResult in
				switch apiResult {
				case .success(let apiResponse):
					result(.success(apiResponse.results))
					
				case .failure(let error):
					result(.failure(error))
				}
			}
	}
}
