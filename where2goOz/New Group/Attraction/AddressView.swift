//
//  AddressView.swift
//  where2goOz
//
//  Created by La Rose Family on 29/12/2023.
//

import SwiftUI
import CoreLocation

struct AddressView: View {
    @State var address: String?
    var attraction: Attraction
    
    var body: some View {
        VStack {
            if address != nil {
                Text("\(address ?? "No address")")
                    .font(Font.caption.lowercaseSmallCaps())
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .italic()
                    
            }
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
                address = ""
                
                if mark.thoroughfare != nil {
                    address = address! + mark.thoroughfare! + ", "
                }
                else if mark.name != nil {
                    address = mark.name! + ", "
                }
                
                if mark.locality != nil {
                    address = address! + mark.locality! + ", "
                }
                
                if mark.administrativeArea != nil {
                    address = address! + mark.administrativeArea!
                }

            }
            else {
                address = "\(attraction.latitude), \(attraction.longitude)"
            }
        }
        
    }
        
}

#Preview {
    AddressView(attraction: Attraction.attractions[3])
}
