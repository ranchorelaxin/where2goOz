//
//  ListTileView.swift
//  where2goOz
//
//  Created by La Rose Family on 28/12/2023.
//

import SwiftUI
import SwiftData

struct ListTileView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var attraction: Attraction
    @EnvironmentObject var locationManager: LocationManager
    @Query private var completions: [CompletionData]
    
    var body: some View {
        VStack {
            HStack {
                AttractionImageIconView(attraction: $attraction, size: 70)
                
                AttractionSummaryView(attraction: $attraction)
                
                Spacer()

            }
        }
        .frame(height: 70)
        .padding(.vertical)
        .padding(.leading, 4)
        .swipeActions(edge: .leading, allowsFullSwipe: false) {
            completionSwipeView
        }
        
    }
    
    var completionSwipeView: some View {
        VStack {
            if attraction.isComplete() {
                Button() {
                    
                    modelContext.delete(completions.first(where: { completion in
                        completion.attraction == attraction
                    })!)
                    
                } label: {
                    
                    Label("Undo", systemImage: "arrow.uturn.backward.circle.fill")
                    
                }.tint(Color.theme.redColor)
                
            } else {
                
                Button() {

                    let c = CompletionData(id: UUID(), attraction: attraction, timestamp: Date())
                    modelContext.insert(c)
                    attraction.completionData = c
                    
                } label: {
                    
                    Label("Complete", systemImage: "checkmark.circle")
                    
                }
                .tint(Color.theme.greenColor)
                
                
            }
        }
    }
}

#Preview {
    ListTileView(attraction: .constant(Attraction.attractions[0]))
        .environmentObject(LocationManager.shared)
}

#Preview {
    ListTileView(attraction: .constant(Attraction.attractions[1]))
        .environmentObject(LocationManager.shared)
}
