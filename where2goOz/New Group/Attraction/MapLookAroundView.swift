//
//  MapLookAroundView.swift
//  where2goOz
//
//  Created by La Rose Family on 28/12/2023.
//

import SwiftUI
import MapKit

struct MapLookAroundView: View {
    @State private var lookAroundScene: MKLookAroundScene?
        
    var attraction: Attraction
        
    var body: some View {
        VStack {
            if lookAroundScene != nil {
                
                LookAroundPreview(initialScene: lookAroundScene)
                    .overlay(alignment: .bottomTrailing) {
                        HStack {
                            Text("\(attraction.name)")
                        }
                        .font(Font.caption.bold())
                        .foregroundStyle(.white)
                        .padding(18)
                    }
                    .frame(height: 128)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    
            }
        }
        .onAppear {
            getLookAroundScene()
        }
        .onChange(of: attraction) {
            getLookAroundScene()
        }
    }
    
    func getLookAroundScene() {
        lookAroundScene = nil
        Task {
            
            let sceneRequest = MKLookAroundSceneRequest(coordinate: attraction.coordinate)
            
            do {
                lookAroundScene = try await sceneRequest.scene
            } catch {
                lookAroundScene = nil
            }
        }
    }
}

#Preview {
    MapLookAroundView(attraction: Attraction.attractions[0])
}
