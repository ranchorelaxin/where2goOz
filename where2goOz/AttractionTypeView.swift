//
//  AttractionTypeTextView.swift
//  where2goOz
//
//  Created by La Rose Family on 29/12/2023.
//

import SwiftUI

struct AttractionTypeView: View {
    
    var attraction: Attraction
    
    var body: some View {
        
        HStack(spacing: 10) {
            ForEach(attraction.attractionTypes) { type in
                
                HStack {
                    Image(type.image)
                        .frame(width: 25)
                    
                    Text("\(type.name)")

                }
                .font(.caption)
                
            }
        }
        .padding()
        .fixedSize(horizontal: false, vertical: true)
    }
}

#Preview {
    AttractionTypeView(attraction: Attraction.attractions[1])
}
