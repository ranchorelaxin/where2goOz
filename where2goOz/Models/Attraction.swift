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
    var id: UUID = UUID()
    var name: String = ""
    var alternateNames: [String]?
    var icon: String = ""
    var imageCredit: String?
    var latitude: Double = 0
    var links: [String]?
    var longitude: Double = 0
    var summary: String = ""
    var rankValue: Double = 0
    var rank: Int = 999
    @Relationship(inverse: \AttractionType.attractions) var attractionTypes: [AttractionType]?
    @Relationship(inverse: \CompletionData.attraction) var completionData: CompletionData?
    
    init(id: UUID, name: String, alternateNames: [String]? = nil, icon: String, imageCredit: String? = nil, latitude: Double, links: [String]? = nil, longitude: Double, summary: String, rankValue: Double, attractionTypes: [AttractionType]) {
        self.id = id
        self.name = name
        self.alternateNames = alternateNames
        self.icon = icon
        self.imageCredit = imageCredit
        self.latitude = latitude
        self.links = links
        self.longitude = longitude
        self.summary = summary
        self.rankValue = rankValue
        self.attractionTypes = attractionTypes
    }
    
    public var coordinate: CLLocationCoordinate2D {
        
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
    }
    
    static func hasThumbnail(id: String) -> Bool {
        
        if let _ = UIImage(named: id) {
            return true
        }
        
        return false
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
    
    public func isComplete() -> Bool {
        if self.completionData != nil {
            return true
        } else {
            return false
        }
    }
    
}

 extension Attraction {
 static var attractions: [Attraction] =
 [
    Attraction.init(id: UUID(uuidString: "D02DE922-ECD1-47E0-A57C-0497540F4DDF")!, name: "Uluru", alternateNames: ["Ayres Rock"], icon: "naturalfeatures", imageCredit: "Steven La Rose", latitude: -25.335509752305455, links: ["https://en.wikipedia.org/wiki/Uluru", "https://www.instagram.com/exploreuluru", "#uluru"], longitude: 131.0044893432509, summary: "Uluru (/ˌuːləˈruː/; Pitjantjatjara: Uluṟu [ˈʊlʊɻʊ]), also known as Ayers Rock (/ˈɛərz/ AIRS) and officially gazetted as Uluru / Ayers Rock,[1] is a large sandstone formation in the centre of Australia. It is in the southern part of the Northern Territory, 335 km (208 mi) south-west of Alice Springs.\n\nUluru is sacred to the Pitjantjatjara, the Aboriginal people of the area, known as the Aṉangu. The area around the formation is home to an abundance of springs, waterholes, rock caves and ancient paintings. Uluru is listed as a UNESCO World Heritage Site. Uluru and Kata Tjuta, also known as the Olgas, are the two major features of the Uluṟu-Kata Tjuṯa National Park.\n\nUluru is one of Australia's most recognisable natural landmarks and has been a popular destination for tourists since the late 1930s. It is also one of the most important indigenous sites in Australia.", rankValue: 100, attractionTypes: []),
 
    Attraction.init(id: UUID(uuidString: "FF3838A8-E033-4E00-9E97-56159921F5F2")!, name: "The Twelve Apostles", icon: "lookouts", latitude: -38.664335994298526, links: ["https://en.wikipedia.org/wiki/The_Twelve_Apostles_(Victoria)", "https://www.instagram.com/visit12apostles", "#12apostles"],longitude: 143.1038148917011, summary: "The Twelve Apostles are a collection of limestone stacks off the shore of Port Campbell National Park, by the Great Ocean Road in Victoria, Australia. The Twelve Apostles are located on the traditional lands of the Eastern Maar peoples.\n\nTheir proximity to one another has made the site a popular tourist attraction. Eight of the original nine stacks remain standing at the Twelve Apostles' viewpoint, after one collapsed in July 2005. Though the view from the promontory by the Twelve Apostles never included twelve stacks, additional stacks —not considered part of the Apostles group— are located to the west within the national park", rankValue: 99.5, attractionTypes: []),
 
    Attraction.init(id: UUID(uuidString: "51B22F19-D630-46A9-BB30-30FF8DD3205D")!, name: "Swim with a Whale Shark", icon: "diving", latitude: -21.93038094145866, links: ["https://www.australiascoralcoast.com/see-do/swim-ningaloo-whale-sharks"], longitude: 114.12230536296242, summary: "Make this year the year you tick off the bucket list experience of swimming with whale sharks at Ningaloo Reef, an experience of a lifetime and a must-do when you're visiting the area. Ningaloo Reef is one of the world's largest fringing reefs, stretching over 300km along Western Australia's coastline, and is one of the only places in the world where whale sharks reliably congregate each year.", rankValue: 99.0, attractionTypes: []),
 
    Attraction.init(id: UUID(uuidString: "464BCBC4-38FE-4C91-8F84-207F8EF22A94")!, name: "Bondi Beach", icon: "beaches", latitude: -33.890619042302674, links: ["https://en.wikipedia.org/wiki/Bondi_Beach", "https://www.instagram.com/bondibeach", "#bondibeach"], longitude: 151.27690992869714, summary: "Bondi Beach is a popular beach and the name of the surrounding suburb in Sydney, New South Wales, Australia. Bondi Beach is located 7 kilometres (4 miles) east of the Sydney central business district, in the local government area of Waverley Council, in the Eastern Suburbs. Bondi Beach is one of the most visited tourist sites in Australia sparking two hit TV series Bondi Rescue and Bondi Vet.", rankValue: 98.5, attractionTypes: []),
 
    Attraction.init(id: UUID(uuidString: "72296CFB-BAC4-4310-A059-4E310D0E59E5")!, name: "Sydney Harbour Bridge", icon: "transport", latitude: -33.8523, links: ["https://en.wikipedia.org/wiki/Sydney_Harbour_Bridge", "https://www.instagram.com/sydneyharbourbridge", "#sydneyharbourbridge"], longitude: 151.2108, summary: "The Sydney Harbour Bridge, know coloquially as 'The Coathanger' is not only a vital transport link for the city of Sydney, but a wordwide icon. It has about a billion lanes and can carry cars, trains and pedestrians", rankValue: 96.6, attractionTypes: []),
 
    Attraction.init(id: UUID(uuidString: "C32EF36B-65E2-4DFF-9222-3380C8CDCA91")!, name: "Hozier Lane Art", icon: "visualarts", latitude: -37.81658599840486, links: [ "https://www.instagram.com/hozierlane", "#hozierlane"], longitude: 144.96918295985571, summary: "The jewel in the crown of Melbourne's iconic laneway art is Hozier Lane. Just minutes from the famous Flinders Street Station, Hozier Lane hosts some of the finest street grafitti in Australia", rankValue: 94.7, attractionTypes: []),
 
    Attraction.init(id: UUID(uuidString: "BF58581B-F224-47DC-AC2E-9623B70852B3")!, name: "Dive with a Great White Shark", icon: "diving", latitude: -35.29409, links: [ "#greatwhiteshark"], longitude: 136.09724, summary: "Take your life into your own hands with a heart pumping dive with the apex predator of the Southern Ocean", rankValue: 93.9, attractionTypes: []),
    
    Attraction.init(id: UUID(uuidString: "0E47E712-C2A2-4578-83A4-45B330A5F518")!, name: "Crocosaurus Cove", icon: "wildlife", imageCredit: "https://www.crocosauruscove.com", latitude: -12.462343728122136, links: ["https://www.crocosauruscove.com", "#croccove"], longitude: 130.83917358255707, summary: "Bringing together some of the largest Saltwater Crocodiles in Australia & boasting the World’s largest display of Australian reptiles, Crocosaurus Cove is a must see attraction when visiting Darwin and the Top End.\nBring your bathers and Swim with the Crocs, jump on our Fishing for Crocs platform and smile for the camera while holding a baby Saltwater Crocodile. Check out the Barramundi, Archer Fish & Whiprays in our 200,000 litre fresh water aquarium and visit our turtles in our Top End Turtle Billabong.\nAll of this and more awaits you at Darwin’s ultimate urban wildlife experience…right in the heart of Mitchell Street, Darwin City.", rankValue: 90.4, attractionTypes: []),
    
    Attraction.init(id: UUID(uuidString: "495F154B-99F3-4532-9996-0D9228FA3EBD")!, name: "Sydney Opera House", icon: "performingarts", imageCredit: "https://www.sydneyoperahouse.com", latitude: -33.85675797979755, links: ["https://www.sydneyoperahouse.com", "#sydneyoperahouse"], longitude: 151.21529724529285, summary: "One of the most iconic buildings in the world – the Sydney Opera House is an architectural masterpiece and vibrant performance space. It's a place where the past shapes the future, where conventions are challenged and cultures are celebrated. Step inside and discover the stories that make the Opera House so inspiring.", rankValue: 92.4, attractionTypes: []),
    
    Attraction.init(id: UUID(uuidString: "583AB7C4-5219-4EC4-9BDB-89EDE014E282")!, name: "Wave Rock", alternateNames: ["Katter Kich"], icon: "naturalfeatures", imageCredit: "https://en.wikipedia.org/wiki/Wave_Rock", latitude: -32.4437871779799, links: ["https://en.wikipedia.org/wiki/Wave_Rock", "#waverock"], longitude: 118.89725104109468, summary: "Wave Rock (Nyungar: Katter Kich) is a natural rock formation that is shaped like a tall breaking ocean wave. The 'wave' is about 15 m (50 ft) high and around 110 m (360 ft) long. It forms the north side of a solitary hill, which is known as 'Hyden Rock'.\n\n This hill, which is a granite inselberg, lies about 3 km (2 mi) east of the small town of Hyden and 296 km (184 mi) east-southeast of Perth, Western Australia. Wave Rock and Hyden Rock are part of a 160 ha (395-acre) nature reserve, Hyden Wildlife Park. More than 100,000 tourists visit every year.", rankValue: 94.9, attractionTypes: []),
    
 ]
 }
 
