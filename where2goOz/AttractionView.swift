//
//  AttractionView.swift
//  where2goOz
//
//  Created by La Rose Family on 26/12/2023.
//

import SwiftUI
import MapKit

struct AttractionView: View {
    
    public var attraction: Attraction
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
            
            Text("\(address)")
                .font(.caption)
                .italic()
                .padding(.horizontal)
            
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
        .onAppear(perform: {
            updateAddress()
        })
    }
    
    func updateAddress() {
        
        let geocoder = CLGeocoder()
        
        // Look up the location and pass it to the completion handler
        geocoder.reverseGeocodeLocation(CLLocation(latitude: attraction.latitude, longitude: attraction.longitude)) { placemark, error in
            if error == nil {
                let mark = placemark![0]
                
                
                
                address = "\(mark.description)"
                
                if mark.name != nil {
                    address = mark.name!
                }
                
                if mark.locality != nil {
                    address = address + ", " + mark.locality!
                }
                
                if mark.administrativeArea != nil {
                    address = address + ", " + mark.administrativeArea!
                }
                
                
                
                //print("\(placemark1?.country)")
            }
            else {
                
            }
        }
        
    }
}

#Preview {
    AttractionView(attraction:Attraction.attractions[0], address: "Address")

}

#Preview {
    AttractionView(attraction:Attraction.attractions[1], address: "Address")
}

#Preview {
    AttractionView(attraction:Attraction.attractions[2], address: "Address")
}
