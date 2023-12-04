//
//  NavigationCoordinator.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/4/23.
//

import UIKit

class NavigationCoordinator {
	
	let services: AppServicesProtocol
	private(set) var navigation: UINavigationController
	
	init(
		services: AppServicesProtocol,
		navigation: UINavigationController = UINavigationController()
	) {
		self.services = services
		self.navigation = navigation
	}
}
