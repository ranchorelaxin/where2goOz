//
//  StateTerritory.swift
//  where2goOz
//
//  Created by La Rose Family on 26/12/2023.
//

import Foundation
import SwiftData
import MapKit

@Model
final class Attraction {
    var id: UUID
    var name: String
    var alternateNames: [String]?
    var icon: String
    var latitude: Double
    var links: [String]?
    var longitude: Double
    var summary: String
    var rankValue: Double
    var atractionTypes: [AttractionType]
    
    init(id: UUID, name: String, alternateNames: [String]? = nil, icon: String, latitude: Double, links: [String]? = nil, longitude: Double, summary: String, rankValue: Double, atractionTypes: [AttractionType]) {
        self.id = id
        self.name = name
        self.alternateNames = alternateNames
        self.icon = icon
        self.latitude = latitude
        self.links = links
        self.longitude = longitude
        self.summary = summary
        self.rankValue = rankValue
        self.atractionTypes = atractionTypes
    }
    
    public var coordinate: CLLocationCoordinate2D {
        
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
    }
    
    public func getDistance(destinationLatitude: Double, destinationLongitude: Double) -> (value: Double, string: String) {
        let PI = Double.pi
        
        // get distance in km
        let distance = acos(sin(destinationLatitude*PI/180)*sin(self.latitude*PI/180) + cos(destinationLatitude*PI/180)*cos(self.latitude*PI/180)*cos(self.longitude*PI/180-destinationLongitude*PI/180)) * 6371
        
        var formattedValue = ""
        
        if distance < 1.0 {
            formattedValue = String(format: "%.0f", distance * 1000)
            return (distance, formattedValue + "m")
        } else if distance <= 10.0 {
            formattedValue = String(format: "%.2f", distance)
            
        } else if distance < 100.0 {
            formattedValue = String(format: "%.1f", distance)
            
        } else {
            formattedValue = String(format: "%.0f", distance)
        }
        
        return (distance, formattedValue + "km")
    }
    
}

extension Attraction {
    static var attractions: [Attraction] =
    [
        Attraction.init(id: UUID(), name: "Uluru", alternateNames: ["Ayres Rock"], icon: "mountains", latitude: -25.335509752305455, links: ["https://en.wikipedia.org/wiki/Uluru", "https://www.instagram.com/exploreuluru", "#uluru"], longitude: 131.0044893432509, summary: "Uluru (/ˌuːləˈruː/; Pitjantjatjara: Uluṟu [ˈʊlʊɻʊ]), also known as Ayers Rock (/ˈɛərz/ AIRS) and officially gazetted as Uluru / Ayers Rock,[1] is a large sandstone formation in the centre of Australia. It is in the southern part of the Northern Territory, 335 km (208 mi) south-west of Alice Springs.\n\nUluru is sacred to the Pitjantjatjara, the Aboriginal people of the area, known as the Aṉangu. The area around the formation is home to an abundance of springs, waterholes, rock caves and ancient paintings. Uluru is listed as a UNESCO World Heritage Site. Uluru and Kata Tjuta, also known as the Olgas, are the two major features of the Uluṟu-Kata Tjuṯa National Park.\n\nUluru is one of Australia's most recognisable natural landmarks and has been a popular destination for tourists since the late 1930s. It is also one of the most important indigenous sites in Australia.", rankValue: 100, atractionTypes: [AttractionType.types[0], AttractionType.types[3]]),
        
        Attraction.init(id: UUID(), name: "The Twelve Apostles", icon: "lookouts", latitude: -38.664335994298526, links: ["https://en.wikipedia.org/wiki/The_Twelve_Apostles_(Victoria)", "https://www.instagram.com/visit12apostles", "#12apostles"],longitude: 143.1038148917011, summary: "The Twelve Apostles are a collection of limestone stacks off the shore of Port Campbell National Park, by the Great Ocean Road in Victoria, Australia. The Twelve Apostles are located on the traditional lands of the Eastern Maar peoples.\n\nTheir proximity to one another has made the site a popular tourist attraction. Eight of the original nine stacks remain standing at the Twelve Apostles' viewpoint, after one collapsed in July 2005. Though the view from the promontory by the Twelve Apostles never included twelve stacks, additional stacks —not considered part of the Apostles group— are located to the west within the national park", rankValue: 99.5, atractionTypes: [AttractionType.types[1], AttractionType.types[2]]),
        
        Attraction.init(id: UUID(), name: "Swim with a Whale Shark", icon: "fish", latitude: -21.93038094145866, links: ["https://www.australiascoralcoast.com/see-do/swim-ningaloo-whale-sharks"], longitude: 114.12230536296242, summary: "Make this year the year you tick off the bucket list experience of swimming with whale sharks at Ningaloo Reef, an experience of a lifetime and a must-do when you're visiting the area. Ningaloo Reef is one of the world's largest fringing reefs, stretching over 300km along Western Australia's coastline, and is one of the only places in the world where whale sharks reliably congregate each year.", rankValue: 99.0, atractionTypes: [AttractionType.types[4], AttractionType.types[5]]),
        
        Attraction.init(id: UUID(), name: "Bondi Beach", icon: "beach", latitude: -33.890619042302674, links: ["https://en.wikipedia.org/wiki/Bondi_Beach", "https://www.instagram.com/bondibeach", "#bondibeach"], longitude: 151.27690992869714, summary: "Bondi Beach is a popular beach and the name of the surrounding suburb in Sydney, New South Wales, Australia. Bondi Beach is located 7 kilometres (4 miles) east of the Sydney central business district, in the local government area of Waverley Council, in the Eastern Suburbs. Bondi Beach is one of the most visited tourist sites in Australia sparking two hit TV series Bondi Rescue and Bondi Vet.", rankValue: 98.5, atractionTypes: [AttractionType.types[1], AttractionType.types[5]])
    ]
}
