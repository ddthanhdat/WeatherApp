//
//  Color.swift
//  WeatherApp
//
//  Created by thanhdat on 19/07/2023.
//

import Foundation
import SwiftUI

extension Color {
	init(hex: String) {
		var hexString = hex
		if (hexString.hasPrefix("#")) {
			hexString.remove(at: hexString.startIndex)
		}
		
		
		let scanner = Scanner(string: hexString)
		scanner.scanLocation = 0
		var rgbValue: UInt64 = 0
		scanner.scanHexInt64(&rgbValue)
		
		let r = (rgbValue & 0xff0000) >> 16
		let g = (rgbValue & 0xff00) >> 8
		let b = rgbValue & 0xff
		
		self.init(
			red: CGFloat(r) / 0xff,
			green: CGFloat(g) / 0xff,
			blue: CGFloat(b) / 0xff
		)
	}
}
