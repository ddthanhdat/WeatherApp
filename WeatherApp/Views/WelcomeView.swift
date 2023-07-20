//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by thanhdat on 15/07/2023.
//

import SwiftUI

struct WelcomeView: View {
	var requestLocation: () -> Void = {}
    var body: some View {
		VStack {
			Text("Welcome to the Weather App")
				.font(.system(size: 30))
			.bold()
			
			Text("Please share your current location to get the weather in your app.")
				.font(.system(size: 22))
				.padding(.top, 10)
			
			Button {
				requestLocation()
			} label: {
				ZStack {
					RoundedRectangle(cornerRadius: 10)
						.foregroundColor(Color.blue)
						.frame(height: 40)
					HStack {
						Image(systemName: "location")
							.foregroundColor(.white)
						Text("Share your location")
							.foregroundColor(.white)
					}
				}
			}.padding()
		}
		.multilineTextAlignment(.center)
		.padding()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
