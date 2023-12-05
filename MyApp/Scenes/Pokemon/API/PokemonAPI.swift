//
//  PokemonAPI.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/4/23.
//

private enum PokemonAPIEndpoints: NetworkEndpoint {
	
	case getPokemons
	case getSample
	
	var urlString: String {
		switch self {
		case .getPokemons:
			return "https://pokeapi.co/api/v2/pokemon"
			
		case .getSample:
			return ""
		}
	}
}

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
		return request(
			endpoint: PokemonAPIEndpoints.getPokemons,
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
