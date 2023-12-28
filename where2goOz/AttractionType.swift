//
//  AttractionType.swift
//  where2goOz
//
//  Created by La Rose Family on 26/12/2023.
//

import Foundation
import SwiftData

@Model
final class AttractionType {
    var id: UUID
    var name: String
    var image: String
    
    init(id: UUID, name: String, image: String) {
        self.id = id
        self.name = name
        self.image = image
    }
}

extension AttractionType {
    static var types: [AttractionType] =
    [
        AttractionType(id: UUID(uuidString: "98B15710-550D-4CCC-9F1D-6A2F0D709BA9")!, name: "Natural Features", image: "naturalfeatures"),
        
        AttractionType(id: UUID(uuidString: "B45BC5DF-DC5E-470C-ABD9-0C62C1EB920A")!, name: "Beaches", image: "beaches"),
        
        AttractionType(id: UUID(uuidString: "047500FC-B6C6-46A5-A920-B0F0326C27FA")!, name: "Lookouts", image: "lookouts"),
        
        AttractionType(id: UUID(uuidString: "D94E47D2-8A13-46A6-9051-6E873D9FC4B8")!, name: "Canyons, Gorges and Caves", image: "gorgecanyoncave"),
        
        AttractionType(id: UUID(), name: "Fauna", image: "fauna"),
        
        AttractionType(id: UUID(), name: "Swimming", image: "swimming")
    ]
    
}
