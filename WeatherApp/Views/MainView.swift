//
//  MainView.swift
//  WeatherApp
//
//  Created by thanhdat on 16/07/2023.
//

import SwiftUI

struct MainView: View {
	@StateObject var viewModel = MainViewViewModel()
	
	init() {
//		print(previewWeather)
	}
	
    var body: some View {
		ZStack {
			VStack {
				if let location = viewModel.location {
					Text("\(location.latitude)")
				} else {
					WelcomeView {
						viewModel.requestLocation()
					}
				}
			}
			if viewModel.isLoading {
				LoadingView()
			}
		}.onAppear {
			viewModel.requestLocation()
		}
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
