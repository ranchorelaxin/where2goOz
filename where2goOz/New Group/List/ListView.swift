//
//  ContentView.swift
//  where2goOz
//
//  Created by La Rose Family on 26/12/2023.
//

import SwiftUI
import SwiftData

struct ListView: View {
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject var locationManager: LocationManager
    @Query(sort: [SortDescriptor(\Attraction.rank, order: .forward)]) private var attractions: [Attraction]
    @Query private var completions: [CompletionData]
    @Query private var types: [AttractionType]
    
    @State var searchText: String = ""
    
    @State var showFilter: Bool = false
    @State var completionStatus: CompletionStatus = .all

    var body: some View {
        NavigationStack {
            List {
                
                ForEach(attractions.filter({ attraction in
                    attraction.name.contains(searchText) || searchText == ""
                }).filter({ attraction in
                    if completionStatus == .all {
                        return true
                    } else if completionStatus == .complete {
                        return attraction.isComplete()
                    } else {
                        return !attraction.isComplete()
                    }
                })) { attraction in
                    
                    NavigationLink {
                        AttractionView(attraction: attraction)
                    }
                    label: {
                        ListTileView(attraction: Binding<Attraction> (
                            get: { attraction },
                            set: { _ in  }
                        ))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .listStyle(.inset)
            .searchable(text: $searchText)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        showFilter = true
                    }, label: {
                        Label("Filter", systemImage: "line.3.horizontal.decrease.circle")
                    })
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addData) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
        .onAppear {
            
            locationManager.requestPermission()
            
        }
        .navigationTitle("Attractions")
        .sheet(isPresented: $showFilter) {
            showFilter = false
        } content: {
            FilterSheetView(completionStatus: $completionStatus)
        }

    }

    private func addData() {
        withAnimation {
            for attraction in attractions {
                modelContext.delete(attraction)
            }
            
            for type in types {
                modelContext.delete(type)
            }
            
            for completion in completions {
                modelContext.delete(completion)
            }
            
            var attraction = Attraction.attractions[0]
            
            let natural = AttractionType(name: "Natural Features", image: "naturalfeatures", attractions: [])
            
            let lookouts = AttractionType(name: "Lookouts", image: "lookouts", attractions: [])
            
            modelContext.insert(attraction)
            modelContext.insert(natural)
            modelContext.insert(lookouts)
            
            attraction.attractionTypes!.append(natural)
            attraction.attractionTypes!.append(lookouts)

            
            // insert 12 apostles
            attraction = Attraction.attractions[1]
            let beaches = AttractionType(name: "Beaches", image: "beaches", attractions: [])
            
            modelContext.insert(attraction)
            modelContext.insert(beaches)
            
            attraction.attractionTypes!.append(beaches)
            attraction.attractionTypes!.append(lookouts)
            attraction.attractionTypes!.append(natural)
            
            // insert whale sharks
            attraction = Attraction.attractions[2]
            let fauna = AttractionType(name: "Fauna", image: "wildlife", attractions: [])
            let swimming = AttractionType(name: "Swimming", image: "swimming", attractions: [])
            let snorkel = AttractionType(name: "Snorkelling", image: "diving", attractions: [])
            let experience = AttractionType(name: "Experience", image: "experiences", attractions: [])
            
            modelContext.insert(attraction)
            modelContext.insert(fauna)
            modelContext.insert(swimming)
            modelContext.insert(snorkel)
            modelContext.insert(experience)
            
            attraction.attractionTypes!.append(fauna)
            attraction.attractionTypes!.append(swimming)
            attraction.attractionTypes!.append(snorkel)
            attraction.attractionTypes!.append(experience)
            
            
            // insert Bondi Beach
            attraction = Attraction.attractions[3]
            modelContext.insert(attraction)
            
            attraction.attractionTypes!.append(swimming)
            attraction.attractionTypes!.append(beaches)

            // Insert Harbour Bridge
            attraction = Attraction.attractions[4]
            let transport = AttractionType(name: "Transport", image: "transport", attractions: [])
            modelContext.insert(attraction)
            
            attraction.attractionTypes!.append(transport)

            // insert Hozier lane
            attraction = Attraction.attractions[5]
            let arts = AttractionType(name: "Visual Arts", image: "visualarts", attractions: [])
            modelContext.insert(attraction)
            attraction.attractionTypes!.append(arts)
            
            // insert Great White
            attraction = Attraction.attractions[6]
            modelContext.insert(attraction)
            attraction.attractionTypes!.append(fauna)
            
            
            // insert Croc Cove
            attraction = Attraction.attractions[7]
            modelContext.insert(attraction)
            attraction.attractionTypes!.append(fauna)
            
            // insert Sydney Opera House
            attraction = Attraction.attractions[8]
            let perfArts = AttractionType(name: "Performing Arts", image: "performingarts", attractions: [])
            modelContext.insert(attraction)
            modelContext.insert(perfArts)
            attraction.attractionTypes!.append(perfArts)
            
            // insert Wave Rock
            attraction = Attraction.attractions[9]
            modelContext.insert(attraction)
            attraction.attractionTypes!.append(natural)
            
            //insert Wineglass Bay
            attraction = Attraction.attractions[10]
            modelContext.insert(attraction)
            attraction.attractionTypes!.append(beaches)
            attraction.attractionTypes!.append(lookouts)
            print("\(attraction.name): \(attraction.id)")
            
            // Insert Cable Beach Camels
            attraction = Attraction.attractions[11]
            modelContext.insert(attraction)
            attraction.attractionTypes!.append(fauna)
            attraction.attractionTypes!.append(experience)
            print("\(attraction.name): \(attraction.id)")
            
            // insert Kata Tjuta
            attraction = Attraction.attractions[12]
            modelContext.insert(attraction)
            attraction.attractionTypes!.append(natural)
            print("\(attraction.name): \(attraction.id)")
            
            // Insert Wilpena Pound
            attraction = Attraction.attractions[13]
            modelContext.insert(attraction)
            attraction.attractionTypes!.append(natural)
            print("\(attraction.name): \(attraction.id)")
            
            // Insert Whitehaven
            attraction = Attraction.attractions[14]
            modelContext.insert(attraction)
            attraction.attractionTypes!.append(beaches)
            attraction.attractionTypes!.append(lookouts)
            attraction.attractionTypes!.append(swimming)
            print("\(attraction.name): \(attraction.id)")
            
            
            
            do {
                try modelContext.save()
            } catch {
                print("Error")
            }
        }
    }
    
    private func addJunkAttractions(number: Int) {
        // Up to here.. add (and delete large amounts of data to check filter lag
        
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(attractions[index])
            }
        }
    }
    
    
}
/*
#Preview {
    ListView()
        .modelContainer(for: Attraction.self, inMemory: true)
        .environmentObject(LocationManager.shared)
        
}
*/
