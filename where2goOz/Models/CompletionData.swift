//
//  CompletionData.swift
//  where2goOz
//
//  Created by La Rose Family on 28/12/2023.
//

import Foundation
import SwiftData

@Model
final class CompletionData {
    var id: UUID = UUID()
    var attraction: Attraction?
    var timestamp: Date = Date()
    var rating: Double?
    var comments: String?
    
    init(id: UUID, attraction: Attraction, timestamp: Date, rating: Double? = nil, comments: String? = nil) {
        self.id = id
        self.attraction = attraction
        self.timestamp = timestamp
        self.rating = rating
        self.comments = comments
    }
}
