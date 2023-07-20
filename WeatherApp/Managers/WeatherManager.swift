//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by thanhdat on 16/07/2023.
//

import Foundation
import CoreLocation


class WeatherManager  {
	let URL_API = "https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=6455ba03671ce9f4338bbfb3874187f9"
	
	func getCurrentWeather(lat: CLLocationDegrees, lng: CLLocationDegrees) async throws -> ResponseBody {
		let url = "https://api.openweathermap.org/data/2.5/weather?lat=10.7110144&lon=106.7352587&appid=6455ba03671ce9f4338bbfb3874187f9"
		return try await ApiManager.fetchData(for: ResponseBody.self, endpoint: url)
	}
}


// Model of the response body we get from calling the OpenWeather API
struct ResponseBody: Codable {
	var coord: CoordinatesResponse
	var weather: [WeatherResponse]
	var main: MainResponse
	var name: String
	var wind: WindResponse
}

struct CoordinatesResponse: Codable {
	var lon: Double
	var lat: Double
}

struct WeatherResponse: Codable {
	var id: Double
	var main: String
	var description: String
	var icon: String
}

struct MainResponse: Codable {
	var temp: Double
	var feels_like: Double
	var temp_min: Double
	var temp_max: Double
	var pressure: Double
	var humidity: Double
}

struct WindResponse: Codable {
	var speed: Double
	var deg: Double
}

extension MainResponse {
	var feelsLike: Double { return feels_like }
	var tempMin: Double { return temp_min }
	var tempMax: Double { return temp_max }
}
