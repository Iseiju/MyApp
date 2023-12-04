//
//  AppServices.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/4/23.
//

protocol AppServicesProtocol {
	
	var apiClient: APIClientProtocol { get }
}

class AppServices: AppServicesProtocol {
	
	var apiClient: APIClientProtocol
	
	init() {
		apiClient = APIClient()
	}
}
