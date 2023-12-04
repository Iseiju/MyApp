//
//  PokemonListViewModel.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/4/23.
//

protocol PokemonListViewModelProtocol {
	
	var cellViewModels: [PokemonListCellViewModelProtocol] { get }
	
	func getPokemons(errorOrNil: @escaping (NetworkError?) -> Void)
}

class PokemonListViewModel: PokemonListViewModelProtocol {
	
	var cellViewModels: [PokemonListCellViewModelProtocol] = []
	
	private let pokemonAPI: PokemonAPIProtocol
	
	init(pokemonAPI: PokemonAPIProtocol) {
		self.pokemonAPI = pokemonAPI
	}

	func getPokemons(errorOrNil: @escaping (NetworkError?) -> Void) {
		pokemonAPI.getPokemons() { [weak self] apiResult in
			guard let self = self else { return }
			
			switch apiResult {
			case .success(let pokemons):
				self.cellViewModels = pokemons.map { PokemonListCellViewModel($0) }
				errorOrNil(nil)
				
			case .failure(let error):
				errorOrNil(error)
			}
		}
	}
}
