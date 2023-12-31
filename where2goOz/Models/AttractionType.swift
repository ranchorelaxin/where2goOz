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

    var name: String = ""
    var image: String = ""
    var attractions: [Attraction]?
    
    init(name: String, image: String, attractions: [Attraction]) {

        self.name = name
        self.image = image
        self.attractions = attractions
        
    }
}
/*
 extension AttractionType {
 static var types: [AttractionType] =
 [
 AttractionType(name: "Natural Features", image: "naturalfeatures"),
 
 AttractionType(name: "Beaches", image: "beaches"),
 
 AttractionType(name: "Lookouts", image: "lookouts"),
 
 AttractionType(name: "Canyons, Gorges and Caves", image: "gorgecanyoncave"),
 
 AttractionType(name: "Fauna", image: "fauna"),
 
 AttractionType(name: "Swimming", image: "swimming")
 ]
 
 }
 */
