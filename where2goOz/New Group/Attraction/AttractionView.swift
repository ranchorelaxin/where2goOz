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
            
            // Map with image overlay
            VStack {
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
                .padding(.bottom, 50)
            }
            

            // Attraction title with alternate names as required
            AttractionTitleView(attraction: attraction)
                .padding()
            
            // Address text if found online
            AddressView(attraction: attraction)
                .padding(.horizontal)
            
            // Grid of relevent types using image and text
            AttractionTypeView(attraction: attraction)
                .padding()
            
            AttractionTextSummaryView(attraction: attraction)
            
            MapLookAroundView(attraction: attraction)
            
            MapRouteView(attraction: attraction)
            
            if attraction.links != nil {
                
                AttractionLinksView(links: attraction.links!)
                    .padding()
            }
            
            if attraction.imageCredit != nil {
                
                AttractionImageCreditView(imageCredit: attraction.imageCredit!)
                    .padding()
            }
            
            Spacer()
            
        }
    }
}

#Preview {
    AttractionView(attraction: Attraction.attractions[0])
        .environmentObject(LocationManager.shared)
}

struct AttractionTitleView: View {
    
    var attraction: Attraction
    
    var body: some View {
        
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
    }
}

struct AttractionTextSummaryView: View {
    
    var attraction: Attraction
    private let sectionFont = Font.title2.lowercaseSmallCaps().bold()
    
    var body: some View {
        
        VStack(spacing: 10) {
            HStack {
                Text("About")
                    .font(sectionFont)
                
                Spacer()
            }
            
            Text("\(attraction.summary)")
        }
        .padding()
    }
}

/*
 HStack(spacing: 2) {
 Text("Icons by ")
 
 Link(destination: URL(string: "https://icons8.com")!, label: {
 Text("Icons8.com")
 .underline()
 })
 
 Spacer()
 }
 .font(.caption)
 */
