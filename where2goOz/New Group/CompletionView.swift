//
//  CompletionView.swift
//  where2goOz
//
//  Created by La Rose Family on 29/12/2023.
//

import SwiftUI
import SwiftData

struct CompletionView: View {
    
    @Query private var completions: [CompletionData]
    @Query private var types: [AttractionType]
    @Query private var attractions: [Attraction]
    
    var body: some View {
        VStack {
            ForEach(completions) {completion in
                VStack {
                    Text("\(completion.timestamp)")
                    Text("\(completion.id)")
                    
                }
            }
            
            Text("Types: \(types.count)")
            
            ForEach(types) { type in
                HStack {
                    Text("\(type.name)")
                    Text("\(type.attractions?.count ?? 0)")
                    
                }
            }
            
            Text("Attractions: \(attractions.count)")
            
            ForEach(attractions) { attraction in
                HStack {
                    Text("\(attraction.name)")
                    Text("\(attraction.attractionTypes?.count ?? 0)")
                    
                }
            }
        }
    }
}

#Preview {
    CompletionView()
}
