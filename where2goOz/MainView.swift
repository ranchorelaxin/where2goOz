//
//  MainView.swift
//  where2goOz
//
//  Created by La Rose Family on 28/12/2023.


import SwiftUI
import SwiftData
import MapKit

struct MainView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query(sort: [SortDescriptor(\Attraction.rankValue, order: .reverse)]) private var attractions: [Attraction]
    @Query private var completions: [CompletionData]
    @EnvironmentObject private var locationManager: LocationManager
    
    var body: some View {
        TabView {
            
            ListView()
                .tabItem {
                    Label("List", systemImage: "list.bullet.circle")
                }
            
            MapView(cameraPosition: MapCameraPosition.camera(locationManager.camera))
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            
            CompletionView()
                .tabItem {
                    Label("\(completions.count)", systemImage: "c.circle")
                }
        }
        .onAppear(perform: {
            var rank = 1
            for attraction in attractions {
                attraction.rank = rank
                rank += 1
            }
        })
    }
}

#Preview {
    MainView()
        .environmentObject(LocationManager.shared)
}
