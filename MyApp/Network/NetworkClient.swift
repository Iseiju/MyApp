//
//  NetworkClient.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/7/23.
//

protocol NetworkClient {
	
	var method: NetworkMethod { get }
	var urlString: String { get }
	var parameters: [String: Any]? { get }
}
