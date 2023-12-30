//
//  AttractionSummaryView.swift
//  where2goOz
//
//  Created by Steve and Sarah on 30/12/2023.
//

import SwiftUI

struct AttractionSummaryView: View {
    
    @Binding var attraction: Attraction
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("#\(attraction.rank)")
                .font(.title2).bold()
            
            Text("\(attraction.name)")
                .font(Font.title3.lowercaseSmallCaps())
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            
            Text("\(attraction.getDistance(destinationLatitude: locationManager.coordinates.latitude, destinationLongitude: locationManager.coordinates.longitude).string)")
                .font(Font.subheadline.lowercaseSmallCaps())
        }
    }
}

#Preview {
    AttractionSummaryView(attraction: .constant(Attraction.attractions[6]))
        .environmentObject(LocationManager.shared)
}
