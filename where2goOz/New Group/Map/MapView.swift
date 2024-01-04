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
    
    @State var cameraPosition: MapCameraPosition// = .region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -15, longitude: 130), span: MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25)))
    @State var cameraDistance: Double = 0

    
    @State var selected: Attraction?
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Map(position: $cameraPosition, interactionModes: [.zoom, .pan, .rotate]) {
                    
                    UserAnnotation()
                    
                    ForEach(attractions) { attraction in
                        
                        Annotation(coordinate: attraction.coordinate) {
                            // perhaps make attraction also an MKMapItem before loading onto map??
                            MapAttractionPin(attraction: attraction)
                            .onTapGesture {
                                
                                withAnimation {
                                    
                                    cameraPosition = MapCameraPosition.camera(MapCamera(centerCoordinate: attraction.coordinate, distance: cameraDistance))
                                    selected = attraction
                                    
                                }
                                
                            }
                        } label: {
                            Text("#\(attraction.rank) \(attraction.name)")
                        }
                    }
                }
                .onTapGesture {
                    if selected != nil {
                        selected = nil
                    }
                    
                }
                .onMapCameraChange { mapCameraUpdateContext in
                    self.cameraDistance = mapCameraUpdateContext.camera.distance
                }
                
                .mapControls {
                    MapCompass()
                    MapUserLocationButton()
                    MapScaleView()
                    MapPitchToggle()
                }
                .mapStyle(.standard(elevation: .realistic))
                
                if let selected {
                    
                    VStack {
                        Spacer()
                        NavigationLink {
                            AttractionView(attraction: selected)
                        } label: {
                            MapCaptionView(attraction: $selected)
                                .padding()
                                .background(Color.theme.background)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(radius: 10)
                        }
                    }
                    .padding(5)
                 
                }
            }
        }
        .ignoresSafeArea(edges: .all)
        .toolbarTitleDisplayMode(.inline)
        .toolbar(.hidden)
    }
}
