//
//  NetworkService.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/4/23.
//

import Foundation

protocol NetworkServiceProtocol {
	
	func request<T: Codable>(
		client: NetworkClient,
		type: T.Type,
		completion: @escaping (Result<T, NetworkError>) -> Void
	) -> NetworkTask
}

final class NetworkService: NetworkServiceProtocol {

	private let session = URLSession.shared
	
	func request<T: Codable>(
		client: NetworkClient,
		type: T.Type,
		completion: @escaping (Result<T, NetworkError>) -> Void
	) -> NetworkTask {
		let defaultHeaders = [
			"Content-Type": "application/json"
		]
		
		var request = URLRequest(url: URL(string: client.urlString)!)
		request.httpMethod = client.method.rawValue.uppercased()
		request.allHTTPHeaderFields = defaultHeaders
		
		if let bodyParameters = client.parameters,
				let bodyData = try? JSONSerialization.data(withJSONObject: bodyParameters, options: []) {
			request.httpBody = bodyData as Data
		}
		
		let task = session.dataTask(with: request) { data, response, error in
			guard error == nil else {
				completion(.failure(.requestFailed))
				return
			}
			
			guard let httpResponse = response as? HTTPURLResponse,
						(200...299).contains(httpResponse.statusCode),
						data != nil else {
				completion(.failure(.invalidResponse))
				return
			}
			
			if let dataResponse = data {
				do {
					let object = try JSONDecoder().decode(type, from: dataResponse)
					completion(.success(object))
				} catch {
					completion(.failure(.decodingFailed))
				}
			}
		}
		
		task.resume()
		return task
	}
}
