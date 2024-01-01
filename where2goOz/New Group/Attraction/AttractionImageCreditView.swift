//
//  AttractionImageCreditView.swift
//  where2goOz
//
//  Created by Steve and Sarah on 1/1/2024.
//

import SwiftUI

struct AttractionImageCreditView: View {
    
    var imageCredit: String
    private let sectionFont = Font.title2.lowercaseSmallCaps().bold()
    
    var body: some View {
        VStack {
            HStack {
                Text("Credits")
                    .font(sectionFont)
                Spacer()
            }
            
            HStack {
                Text("Photo credit: \(imageCredit)")
                    .font(.caption)
                    .italic()
                
                Spacer()
            }
        }
    }
}

#Preview {
    AttractionImageCreditView(imageCredit: "www.example.com")
}
