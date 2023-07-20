//
//  WeatherRow.swift
//  WeatherApp
//
//  Created by thanhdat on 20/07/2023.
//

import SwiftUI

struct WeatherRow: View {
	var logo: String
	var name: String
	var value: String
	
	
    var body: some View {
		HStack(spacing: 15) {
			Image(systemName: logo)
				.font(.title2)
				.frame(width: 15, height: 15)
				.padding()
				.background(Color(hex: "#E2E2E2"))
				.cornerRadius(55)
				.foregroundColor(.black)
			
			VStack(alignment: .leading, spacing: 8) {
				Text(name)
					.font(.caption)
					.foregroundColor(Color(hex: "#141752"))
				Text(value)
					.font(.title2)
					.foregroundColor(Color(hex: "#141752"))
			}
		}
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(
		logo: "thermometer.medium", name: "String", value: "String"
		)
    }
}
