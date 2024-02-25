//
//  PokemonListViewModel.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/4/23.
//

import RxCocoa

protocol PokemonListViewModelProtocol {
	
	var cvmRelay: BehaviorRelay<[PokemonListCellViewModelProtocol]> { get }
	
	func getPokemons(errorOrNil: @escaping (NetworkError?) -> Void)
}

class PokemonListViewModel: PokemonListViewModelProtocol {
	
	let cvmRelay = BehaviorRelay<[PokemonListCellViewModelProtocol]>(value: [])
	
	private let pokemonAPI: PokemonAPIProtocol
	
	init(pokemonAPI: PokemonAPIProtocol) {
		self.pokemonAPI = pokemonAPI
	}

	func getPokemons(errorOrNil: @escaping (NetworkError?) -> Void) {
		pokemonAPI.getPokemons() { [weak self] apiResult in
			switch apiResult {
			case .success(let pokemons):
				let cellViewModels = pokemons.map { PokemonListCellViewModel($0) }
				self?.cvmRelay.accept(cellViewModels)
				
				errorOrNil(nil)
				
			case .failure(let error):
				errorOrNil(error)
			}
		}
	}
}
