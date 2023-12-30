//
//  MapView.swift
//  where2goOz
//
//  Created by La Rose Family on 28/12/2023.
//

import SwiftUI
import MapKit
import SwiftData

struct MapView: View {
    
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject var locationManager: LocationManager
    @Query private var attractions: [Attraction]
    
    var body: some View {
        Map {
            ForEach(attractions) { attraction in
                Marker(coordinate: attraction.coordinate) {
                    Text("\(attraction.name)")
                }
            }
        }
    }
}

#Preview {
    MapView()
        .environmentObject(LocationManager.shared)
}
