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
        let accent = Color("appAccent")
        let background = Color("appBackground")
        let greenColor = Color("appGreen")
        let redColor = Color("appRed")
        let blueColor = Color("appBlue")
    }
}

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}

/*
extension Font {
    static let theme = Font()
    
    struct FontTheme {
        let sectionFont = Font.title2.lowercaseSmallCaps().bold()
    }
}
*/
