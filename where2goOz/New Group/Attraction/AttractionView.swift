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
    private let sectionFont = Font.title2.lowercaseSmallCaps().bold()
    
    var body: some View {
        ScrollView {
            
            Map(initialPosition: MapCameraPosition.region(MKCoordinateRegion(center: attraction.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)), interactionModes: MapInteractionModes()) {
                
                Marker("\(attraction.name)", coordinate: attraction.coordinate)
                    .tint(attraction.isComplete() ? Color.theme.greenColor : Color.theme.redColor)
                
            }
            .frame(height: 250)
            .ignoresSafeArea()
            .overlay(alignment: .bottom) {
                    AttractionImageIconView(attraction: $attraction, size: 100)
                        .offset(y: 50)
            }
            
            VStack {
                Text("\(attraction.name)")
                    .multilineTextAlignment(.center)
                    .bold()
                    .font(.title)
                
                
                if !(attraction.alternateNames == nil) {
                    ForEach(attraction.alternateNames!, id: \.self) { altName in
                        Text(" \(altName) ")
                            .italic()
                    }
                }
            }
            .padding(.top, 50)
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
            
            if attraction.links != nil {
                AttractionLinksView(links: attraction.links!)
            }
            
            VStack(alignment: .leading, spacing: 15) {
                
                HStack {
                    Text("Licencing")
                        .font(sectionFont)
                    Spacer()
                }
                
                if attraction.imageCredit != nil {
                    
                    HStack {
                        Text("Photo credit: \(attraction.imageCredit!)")
                            .font(.caption)
                            .italic()
                        
                        Spacer()
                    }
                }
                
                HStack(spacing: 2) {
                    Text("Icons by ")
                    
                    Link(destination: URL(string: "https://icons8.com")!, label: {
                        Text("Icons8.com")
                            .underline()
                    })
                    
                    Spacer()
                }
                .font(.caption)
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    AttractionView(attraction: Attraction.attractions[0])
        .environmentObject(LocationManager.shared)
}
