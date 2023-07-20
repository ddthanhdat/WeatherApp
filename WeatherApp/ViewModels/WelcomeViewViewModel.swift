//
//  WelcomeViewViewModel.swift
//  WeatherApp
//
//  Created by thanhdat on 15/07/2023.
//

import SwiftUI

struct WelcomeViewViewModel: View {

	
    var body: some View {
		VStack {
			Text("Welcome to the Weather App")
				.font(.system(size: 30))
			.bold()
			
			Text("Please share your current location to get the weather in your app.")
				.font(.system(size: 22))
				.padding(.top, 10)
			
			Button {
				
			} label: {
				ZStack {
					RoundedRectangle(cornerRadius: 10)
						.foregroundColor(Color.blue)
					Text("Share your location")
						.foregroundColor(.white)
				}
			}
			
			Spacer()
		}
		.multilineTextAlignment(.center)
		.padding()
		
		

    }
}

struct WelcomeViewViewModel_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeViewViewModel()
    }
}
