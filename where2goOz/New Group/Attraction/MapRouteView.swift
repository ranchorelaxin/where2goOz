//
//  MapRouteView.swift
//  where2goOz
//
//  Created by La Rose Family on 28/12/2023.
//

import SwiftUI
import MapKit

struct MapRouteView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    @State private var destinationMapItem: MKMapItem?
    @State private var startMapItem: MKMapItem?
    @State private var route: MKRoute?
    @State private var distance: String?
    
    private let sectionFont = Font.title2.lowercaseSmallCaps().bold()
    
    var attraction: Attraction
    
    var body: some View {
        VStack {
            if route != nil {
                HStack {
                    Text("Navigation")
                        .font(sectionFont)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                Map(selection: $destinationMapItem) {
                    // Adding the marker for the starting point
                    Marker("My Location", coordinate: locationManager.coordinates)
                    Marker("\(attraction.name)", coordinate: CLLocationCoordinate2D(latitude: attraction.latitude, longitude: attraction.longitude))
                    // Show the route if it is available
                    if let route {
                        MapPolyline(route)
                            .stroke(.blue, lineWidth: 3)
                    }
                }
                .overlay(alignment: .bottomTrailing) {
                    HStack {
                        Text("\(self.distance ?? "Error")")
                    }
                    .padding(5)
                    .background(.gray)
                    .font(Font.caption.bold())
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(5)
                    
                }
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
            }
        }
        
        .onTapGesture {
            openMaps()
        }
         
        .onChange(of: destinationMapItem){
            print("Getting directions")
            getDirections()
        }
        .onAppear {
            print("Updating...")
            
            self.startMapItem = MKMapItem(placemark: MKPlacemark(coordinate: locationManager.coordinates))
            self.startMapItem?.name = "My Location"
            
            self.destinationMapItem = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: attraction.latitude, longitude: attraction.longitude)))
            self.destinationMapItem?.name = "\(attraction.name)"
            
        }
    }
    
    func getDirections() {
        self.route = nil
        
        // Create and configure the request
        let request = MKDirections.Request()
        request.source = self.startMapItem
        request.destination = self.destinationMapItem
        
        // Get the directions based on the request
        Task {
            let directions = MKDirections(request: request)
            do {
                let response = try await directions.calculate()
                route = response.routes.first
                setDistance(metres: response.routes.first!.distance)
            } catch {
                print("Error \(error.localizedDescription)")
                
                return
            }
        }
    }
    
    func setDistance(metres: Double) {
        print("Metres: \(metres)")
        var formattedValue = ""
        
        if metres < 1000 {
            formattedValue = String(format: "%.0f", metres)
            self.distance = formattedValue + "m"
            
        } else if metres <= 10000 {
            formattedValue = String(format: "%.2f", metres/1000)
            self.distance = formattedValue + "km"
            
        } else if metres < 100000 {
            formattedValue = String(format: "%.1f", metres/1000)
            self.distance = formattedValue + "km"
            
        } else {
            formattedValue = String(format: "%.0f", metres/1000)
            self.distance = formattedValue + "km"
        }
        
        
    }
    
    func openMaps() {
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: attraction.coordinate))
        mapItem.name = attraction.name
        
        let options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving] as [String : Any]
        
        MKMapItem.openMaps(with: [mapItem], launchOptions: options)
    }
}

#Preview {
    MapRouteView(attraction: Attraction.attractions[0])
}


