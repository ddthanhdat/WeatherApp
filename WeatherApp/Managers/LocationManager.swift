//
//  LocationManager.swift
//  WeatherApp
//
//  Created by thanhdat on 15/07/2023.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
	// Creating an instance of CLLocationManager, the framework we use to get the coordinates
	let manager = CLLocationManager()
	
	var location: CLLocationCoordinate2D? = nil
	var isLoading = false
	var errorMessage = ""
	
	private var completionHandler: ((Result<CLLocationCoordinate2D, Error>) -> Void)?

	
	override init() {
		super.init()
		manager.delegate = self
		manager.requestWhenInUseAuthorization()
	}

	// Requests the one-time delivery of the user’s current location, see https://developer.apple.com/documentation/corelocation/cllocationmanager/1620548-requestlocation
	func requestLocation(completion: @escaping (Result<CLLocationCoordinate2D, Error>) -> Void) {
		DispatchQueue.main.async {
			self.manager.requestLocation()
			self.completionHandler = completion
		}
	}
	
	// Set the location coordinates to the location variable
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		guard let newLocation = locations.last?.coordinate else { return }
		self.completionHandler?(.success(newLocation))
		self.completionHandler = nil
		isLoading = false
	}
	
	
	// This function will be called if we run into an error
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print("Error getting location: ", error)
		self.completionHandler?(.failure(error))
		self.completionHandler = nil
		isLoading = false
		errorMessage = error.localizedDescription
		// Handle the error appropriately
	}
}
