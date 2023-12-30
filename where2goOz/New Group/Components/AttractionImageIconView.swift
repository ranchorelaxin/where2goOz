//
//  ImageIconView.swift
//  where2goOz
//
//  Created by Steve and Sarah on 30/12/2023.
//

import SwiftUI

struct AttractionImageIconView: View {
    
    @Binding var attraction: Attraction
    var size: CGFloat
    
    var body: some View {
        
        VStack {
            if Attraction.hasThumbnail(id: attraction.id.uuidString) {
                
                Image("\(attraction.id.uuidString)")
                    .resizable()
                    .frame(width: size, height: size)
                    .background(.regularMaterial)
                    .clipShape(Circle())
                
                
            } else {
                Image("\(attraction.icon)")
                    .resizable()
                    .padding(size*0.175)
                    .background(Color.theme.background)
                    .frame(width: size, height: size)
                    .clipShape(Circle())
            }
        }
        .overlay{
            attraction.isComplete() ?
            Circle()
                .stroke(Color.theme.greenColor, lineWidth: 4):
            Circle()
                .stroke(Color.theme.redColor, lineWidth: 4)
        }
    }
}

#Preview {
    AttractionImageIconView(attraction: .constant(Attraction.attractions[0]), size: 70)
}

#Preview {
    AttractionImageIconView(attraction: .constant(Attraction.attractions[1]), size: 70)
}
