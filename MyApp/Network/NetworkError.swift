//
//  NetworkError.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/4/23.
//

enum NetworkError: Error {
	
	case invalidURL
	case invalidResponse
	case requestFailed
	case decodingFailed
}
