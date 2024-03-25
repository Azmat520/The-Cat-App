//
//  ColorExtensions.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import SwiftUI

extension Color {
    static var random: Color {
        Color(UIColor(red: .random(in: 0...1),
                             green: .random(in: 0...1),
                             blue: .random(in: 0...1),
                             alpha: 1))
    }
}

