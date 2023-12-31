//
//  MapCaptionView.swift
//  where2goOz
//
//  Created by La Rose Family on 31/12/2023.
//

import SwiftUI

struct MapCaptionView: View {
    
    @Binding var attraction: Attraction?
    
    var body: some View {
        
        HStack {
            AttractionImageIconView(attraction: Binding<Attraction> (
                get: { attraction! },
                set: { _ in  }
            ), size: 70)
            
            AttractionSummaryView(attraction: Binding<Attraction> (
                get: { attraction! },
                set: { _ in  }
            ))
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .padding()
                .frame(width: 15)
                .foregroundStyle(Color.theme.blueColor)
            
        }
    }
}

#Preview {
    MapCaptionView(attraction: .constant(Attraction.attractions[0]))
}
