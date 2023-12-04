//
//  APIResponse.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/4/23.
//

struct APIResponse<T: Codable>: Codable {
	
	var count: Int
	var next: String?
	var previous: String?
	var results: T
}
