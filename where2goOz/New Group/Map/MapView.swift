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
                        let color = attraction.isComplete() ? Color.theme.greenColor : Color.theme.redColor
                        
                        Annotation(coordinate: attraction.coordinate) {
                            VStack(spacing: 0) {
                                Image(attraction.icon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .padding(10)
                                    .colorInvert()
                                    .background(color)
                                    .clipShape(Circle())
                                
                                Image(systemName: "triangle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 10, height: 10)
                                    .rotationEffect(Angle(degrees: 180))
                                    .foregroundColor(color)
                                    .offset(y: -3)
                            }
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
                /*
                 .onTapGesture {
                 if active != nil {
                 active = nil
                 }
                 }
                 */
                if active != nil {
                    
                    VStack {
                        Spacer()
                        NavigationLink {
                            AttractionView(attraction: active!)
                        } label: {
                            HStack {
                                AttractionImageIconView(attraction: Binding<Attraction> (
                                    get: { active! },
                                    set: { _ in  }
                                ), size: 70)
                                
                                AttractionSummaryView(attraction: Binding<Attraction> (
                                    get: { active! },
                                    set: { _ in  }
                                ))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .padding()
                                    .frame(width: 15)
                                    .foregroundStyle(Color.theme.blueColor)
                                
                                
                            }
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
