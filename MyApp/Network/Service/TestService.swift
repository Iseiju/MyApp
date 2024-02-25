//
//  TestService.swift
//  MyApp
//
//  Created by Kenneth James Uy on 2/14/24.
//

import Foundation

protocol TestServiceProtocol {
	
	func request<T: Codable>(
		urlString: String,
		model: T.Type,
		completion: @escaping (Result<T, NetworkError>) -> Void
	)
}

class TestService: TestServiceProtocol {
	
	func request<T: Codable>(
		urlString: String,
		model: T.Type,
		completion: @escaping (Result<T, NetworkError>) -> Void
	) {
		guard let url = URL(string: urlString) else {
			completion(.failure(.invalidURL))
			return
		}
		
		let headers = ["Auth": "asdsadas"]
		let body = ["asd": "asd"]
		
		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		request.allHTTPHeaderFields = headers
		
		if let bodyParams = try? JSONSerialization.data(withJSONObject: body) {
			request.httpBody = bodyParams
		}
		
		let task = URLSession.shared.dataTask(with: request) { data, _, error in
			guard error == nil else {
				completion(.failure(.requestFailed))
				return
			}
			
			if let dataResponse = data {
				do {
					let object = try JSONDecoder().decode(model, from: dataResponse)
					completion(.success(object))
				} catch {
					completion(.failure(.decodingFailed))
				}
			} else {
				completion(.failure(.invalidResponse))
			}
		}
		
		task.resume()
	}
}
