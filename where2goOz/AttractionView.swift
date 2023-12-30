//
//  AttractionView.swift
//  where2goOz
//
//  Created by La Rose Family on 26/12/2023.
//

import SwiftUI
import MapKit

struct AttractionView: View {
    
    @State var attraction: Attraction
    @State var address: String = ""
    
    var body: some View {
        ScrollView {
            
            Map(initialPosition: MapCameraPosition.region(MKCoordinateRegion(center: attraction.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)), interactionModes: MapInteractionModes()) {
                
                Marker("\(attraction.name)", coordinate: attraction.coordinate)
                .tint(.green)
                
            }
            .frame(height: 250)
            .ignoresSafeArea()
            
            VStack {
                Text("\(attraction.name)")
                    .bold()
                    .font(.title)
                
                
                if !(attraction.alternateNames == nil) {
                    ForEach(attraction.alternateNames!, id: \.self) { altName in
                        Text(" \(altName) ")
                            .italic()
                    }
                    
                }
            }
            .padding()
            
            VStack {
                 AddressView(attraction: attraction)
            }
            
            VStack {
                
                AttractionTypeView(attraction: attraction)
                
            }
            
            Text("\(attraction.summary)")
                .padding()
            
            VStack {
                
                MapLookAroundView(attraction: attraction)
                    
            }
            
            VStack {
                
                MapRouteView(attraction: attraction)
                
            }
            
            Spacer()
        }
    }
}

#Preview {
    AttractionView(attraction: Attraction.attractions[0])
        .environmentObject(LocationManager.shared)
}
