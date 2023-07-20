//
//  ApiManager.swift
//  WeatherApp
//
//  Created by thanhdat on 18/07/2023.
//

import Foundation


class ApiManager {
	
	static func fetchData<T: Codable>(for: T.Type, endpoint: String) async throws -> T {
		guard let url = URL(string: endpoint) else {
			throw GHError.invalidUrl
		}
		
		let (data, resp) = try await URLSession.shared.data(from: url)
				
		guard let resp = resp as? HTTPURLResponse , resp.statusCode == 200 else {
			throw GHError.invalidResponse
		}
		
		do {
			let decoder = JSONDecoder()
			decoder.keyDecodingStrategy = .convertFromSnakeCase
			return try decoder.decode(T.self, from: data)
		} catch {
			throw GHError.invalidData
		}
	}
}


enum GHError: Error {
	case invalidUrl
	case invalidResponse
	case invalidData
}
