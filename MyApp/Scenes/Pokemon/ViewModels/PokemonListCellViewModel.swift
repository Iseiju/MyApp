//
//  PokemonListCellViewModel.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/4/23.
//

protocol PokemonListCellViewModelProtocol {
	
	var name: String { get }
}

class PokemonListCellViewModel: PokemonListCellViewModelProtocol {
	
	var name: String {
		return pokemon.name
	}
	
	var pokemon: Pokemon
	
	init(_ pokemon: Pokemon) {
		self.pokemon = pokemon
	}
}
