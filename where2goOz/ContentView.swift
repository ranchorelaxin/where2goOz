//
//  ContentView.swift
//  where2goOz
//
//  Created by La Rose Family on 26/12/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject var locationManager: LocationManager
    @Query private var attractions: [Attraction]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(attractions) { attraction in
                    NavigationLink {
                        AttractionView(attraction: attraction)
                    } label: {
                        Text(attraction.name)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
        .onAppear {
            
            locationManager.requestPermission()
            
        }
    }

    private func addItem() {
        withAnimation {
            for i in 0...3 {
                modelContext.delete(attractions[i])
            }
            
            for i in 0...3 {
                let newItem = Attraction.attractions[i]
                modelContext.insert(newItem)
            }
            
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(attractions[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Attraction.self, inMemory: true)
}
