//
//  LoadingView.swift
//  WeatherApp
//
//  Created by thanhdat on 16/07/2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
		ZStack {
			Color.gray.opacity(0.8)
			Text("Loading!")
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
//		.background(Color.gray)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
