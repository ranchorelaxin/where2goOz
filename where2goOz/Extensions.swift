//
//  Extensions.swift
//  where2goOz
//
//  Created by La Rose Family on 28/12/2023.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    
    struct ColorTheme {
        let accent = Color("AccentColor")
        let background = Color("BackgroundColor")
        let greenColor = Color("GreenColor")
        let redColor = Color("RedColor")
        let blueColor = Color("BlueColor")
        let secondaryText = Color("SecondaryTextColor")
        let gradientStart = Color("GradientStart")
        let gradientEnd = Color("GradientEnd")
    }
}

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
