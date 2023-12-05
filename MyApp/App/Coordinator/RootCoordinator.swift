//
//  RootCoordinator.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/4/23.
//

import UIKit

final class RootCoordinator: NavigationCoordinator {
	
	private var window: UIWindow
	
	init(
		_ window: UIWindow,
		services: AppServicesProtocol,
		navigation: UINavigationController = UINavigationController()
	) {
		self.window = window
		
		super.init(services: services, navigation: navigation)
	}
	
	func start() {
		let pokemonListCoordinator = PokemonListCoordinator(services: services, navigation: navigation)
		pokemonListCoordinator.start()
		window.rootViewController = pokemonListCoordinator.navigation
		window.makeKeyAndVisible()
	}
}
