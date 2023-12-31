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
    
    @State var camera: MapCameraPosition
    @State var distance: Double = 10000
    @State var active: Attraction?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Map(position: $camera, interactionModes: [.zoom, .pan, .rotate]) {
                    ForEach(attractions) { attraction in
                        
                        Annotation(coordinate: attraction.coordinate) {
                            
                            MapAttractionPin(attraction: attraction)
                            .onTapGesture {
                                withAnimation {
                                    camera = MapCameraPosition.camera(MapCamera(centerCoordinate: attraction.coordinate, distance: distance))
                                    active = attraction
                                }
                            }
                        } label: {
                            Text("#\(attraction.rank) \(attraction.name)")
                        }
                    }
                }
                
                if active != nil {
                    
                    VStack {
                        Spacer()
                        NavigationLink {
                            AttractionView(attraction: active!)
                        } label: {
                            MapCaptionView(attraction: $active)
                                .padding()
                                .background(Color.theme.background)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(radius: 10)
                        }
                        
                    }
                    .padding(5)
                    .toolbarTitleDisplayMode(.inline)
                    .toolbar(.hidden)
                    
                }
                
            }
            
        }
    }
}
