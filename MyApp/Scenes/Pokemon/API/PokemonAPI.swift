//
//  PokemonAPI.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/4/23.
//

private enum PokemonAPI: NetworkClient {
	
	case getPokemons
	case getSample
	
	var method: NetworkMethod {
		switch self {
		case .getPokemons:
			return .get
			
		case .getSample:
			return .get
		}
	}
	
	var urlString: String {
		switch self {
		case .getPokemons:
			return "https://pokeapi.co/api/v2/pokemon"
			
		case .getSample:
			return ""
		}
	}
	
	var parameters: [String : Any]? { return nil }
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
			client: PokemonAPI.getPokemons,
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
