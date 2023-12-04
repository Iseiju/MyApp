//
//  APIClient.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/4/23.
//

import Foundation

protocol APIClientProtocol {
	
	func request<T: Codable>(
		urlString: String,
		parameters: [String: Any]?,
		method: Method,
		type: T.Type,
		completion: @escaping (Result<T, NetworkError>) -> Void
	) -> URLSessionDataTask
}

class APIClient: APIClientProtocol {

	private let session = URLSession.shared
	
	func request<T: Codable>(
		urlString: String,
		parameters: [String: Any]? = nil,
		method: Method,
		type: T.Type,
		completion: @escaping (Result<T, NetworkError>) -> Void
	) -> URLSessionDataTask {
		let defaultHeaders = [
			"Content-Type": "application/json"
		]
		
		var request = URLRequest(url: URL(string: urlString)!)
		request.httpMethod = method.rawValue.uppercased()
		request.allHTTPHeaderFields = defaultHeaders
		
		if let bodyParameters = parameters,
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

enum Method: String {
	
	case get
	case post
	case put
}

enum NetworkError: Error {
	
	case invalidURL
	case invalidResponse
	case requestFailed
	case decodingFailed
}
