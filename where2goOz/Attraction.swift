//
//  StateTerritory.swift
//  where2goOz
//
//  Created by La Rose Family on 26/12/2023.
//

import Foundation
import SwiftData

@Model
final class Attraction {
    var id: UUID
    var name: String
    var shortName: String
    
    init(id: UUID, name: String, shortName: String) {
        self.id = id
        self.name = name
        self.shortName = shortName
    }
}

extension Attraction {
    static let sampleStates: [Attraction] =
    [
        Attraction.init(id: UUID(), name: "Northern Territory", shortName: "NT"),
        Attraction.init(id: UUID(), name: "Queensland", shortName: "QLD"),
    ]
}
