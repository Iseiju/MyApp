//
//  PokemonListCoordinator.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/4/23.
//

class PokemonListCoordinator: NavigationCoordinator {
	
	func start() {
		guard let pokemonListController = R
			.storyboard.pokemon.pokemonListController()
		else { return }
		
		pokemonListController.viewModel = PokemonListViewModel(pokemonAPI: services.pokemonAPI)
		
		navigation.pushViewController(pokemonListController, animated: true)
	}
}
