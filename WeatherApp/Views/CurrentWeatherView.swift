//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by thanhdat on 16/07/2023.
//

import SwiftUI

struct CurrentWeatherView: View {
	var defaultData: ResponseBody
	
	var body: some View {
		ZStack {
			VStack {
				VStack(alignment: .leading) {
					Text("\(defaultData.name)")
						.font(.system(size: 28))
						.foregroundColor(.white)
						.bold()
					Text("\(Date().formatted(date: .abbreviated, time: .shortened))")
						.font(.system(size: 13))
						.foregroundColor(.gray)
				}
				.frame(maxWidth: .infinity, alignment: .leading)
			
				
				HStack(alignment: .center) {
					VStack(alignment: .center) {
						
						Image(systemName: "sun.max")
							.foregroundColor(.white)
							.font(.system(size: 40))
						Text(defaultData.weather[0].main)
							.font(.system(size: 13))
							.foregroundColor(.white)
							.padding(.top, 15)
					}
					Spacer()
					Text("\(defaultData.main.feelsLike.roundDouble())°C")
						.font(.system(size: 75))
						.foregroundColor(.white)
						.bold()
						.padding(.trailing, 10)
				}.padding(.top, 10)
				
				
				AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_640.png"), scale: 2.0)
			
				
				VStack {
					Spacer()
					
					VStack(alignment: .leading) {
						Text("Weather now")
							.foregroundColor(.black)
						
						HStack {
							WeatherRow(logo: "thermometer.low", name: "Min Temp", value: "\(defaultData.main.tempMin.roundDouble())°C")
							
							Spacer()
							WeatherRow(logo: "thermometer.high", name: "Max Temp", value: "\(defaultData.main.tempMax.roundDouble())°C")
						}
						
						HStack {
							WeatherRow(logo: "wind", name: "Wind Speed", value: "\(defaultData.wind.speed.roundDouble())m/s")
							Spacer()
							WeatherRow(logo: "humidity", name: "Mumidity", value: "\(defaultData.main.humidity.roundDouble())%")
						}
					}
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding()
					.padding(.bottom, 20)
					.foregroundColor(.white)
					.background(.white)
					.cornerRadius(20)
				}

				
//				ZStack {
//					RoundedRectangle(cornerRadius: 30)
//						.foregroundColor(.white)
//						.frame(height: 200)
//
//
//					VStack {
//						HStack {
//							Text("Weather now")
//								.foregroundColor(Color(hex: "#141752"))
//								.bold()
//								.padding(.top, 20)
//								.padding(.leading, 20)
//							Spacer()
//						}
//						Spacer()
//
//					}
//					.frame(height: 200)
//				}
			}
			.padding()
		}
		.edgesIgnoringSafeArea(.bottom)
//		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color(hex: "#131755"))
		.preferredColorScheme(.dark)
	}
}


struct CurrentWeatherView_Previews: PreviewProvider {
	static var previews: some View {
		CurrentWeatherView(defaultData: previewWeather)
	}
}
