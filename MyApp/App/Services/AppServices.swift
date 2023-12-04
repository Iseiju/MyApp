//
//  AppServices.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/4/23.
//

protocol AppServicesProtocol {
	
	var networkService: NetworkServiceProtocol { get }
	var pokemonAPI: PokemonAPIProtocol { get }
}

class AppServices: AppServicesProtocol {
	
	var networkService: NetworkServiceProtocol
	var pokemonAPI: PokemonAPIProtocol
	
	init() {
		let networkService = NetworkService()
		self.networkService = networkService
		
		pokemonAPI = networkService
	}
}
