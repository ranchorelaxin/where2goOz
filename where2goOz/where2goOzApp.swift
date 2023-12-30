//
//  where2goOzApp.swift
//  where2goOz
//
//  Created by La Rose Family on 26/12/2023.
//

import SwiftUI
import SwiftData

@main
struct where2goOzApp: App {
    
    @StateObject private var locationManager = LocationManager.shared
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Attraction.self, CompletionData.self, AttractionType.self
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(locationManager)
        }
        .modelContainer(sharedModelContainer)
    }
}
