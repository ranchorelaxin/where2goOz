//
//  MapMarker.swift
//  where2goOz
//
//  Created by Steve and Sarah on 31/12/2023.
//

import SwiftUI
import MapKit

struct MapAttractionPin: View {
    var attraction: Attraction
    
    var body: some View {
        
        VStack {
            /*let color = attraction.isComplete() ? Color.theme.greenColor : Color.theme.redColor
             Annotation(coordinate: attraction.coordinate) {
             Image(attraction.icon)
             .resizable()
             .scaledToFit()
             .frame(width: 20, height: 20)
             .padding(10)
             .colorInvert()
             //.background(color)
             .clipShape(Circle())
             
             Image(systemName: "triangle.fill")
             .resizable()
             .scaledToFit()
             .frame(width: 10, height: 10)
             .rotationEffect(Angle(degrees: 180))
             //.foregroundColor(color)
             .offset(y: -3)
             .padding(.bottom, 40)
             } label: {
             Text("Y")
             }
             }
             
             VStack(spacing: 0) {
             
             
             
             
             }
             
             */
        }
    }
}

#Preview {
    MapAttractionPin(attraction: Attraction.attractions[3])
}
