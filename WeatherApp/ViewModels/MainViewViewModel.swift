//
//  MainViewViewModel.swift
//  WeatherApp
//
//  Created by thanhdat on 16/07/2023.
//

import Foundation
import CoreLocation

class MainViewViewModel: ObservableObject {
	@Published var errorMessage = ""
	private var locationManager = LocationManager()
	private var weatherManager = WeatherManager()
	
	@Published var location: CLLocationCoordinate2D? = nil
	@Published var isLoading: Bool = false
	
	init() {
		
	}
	
	func requestLocation() {
		print("requestLocation")
//		if location != nil {
			Task {
				do {
					let a = try await weatherManager.getCurrentWeather(lat: location?.latitude ?? 0, lng: location?.longitude ?? 0)
					print(a)
				} catch {
					print("Image loading failed: \(error)")
				}
			}
//		}

//		isLoading = true
//		locationManager.requestLocation { result in
//			switch result {
//			case .success(let coordinates):
//				// Handle successful location retrieval
//				self.location = coordinates
//				print("Latitude: \(coordinates.latitude), Longitude: \(coordinates.longitude)")
//			case .failure(let error):
//				// Handle error
//				print("Error: \(error.localizedDescription)")
//			}
//			self.isLoading = false
//		}
//		errorMessage += "1"
	}
	
}
