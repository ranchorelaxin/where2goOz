//
//  AttractionLinksView.swift
//  where2goOz
//
//  Created by La Rose Family on 31/12/2023.
//

import SwiftUI

struct AttractionLinksView: View {
    var links: [String]
    private let sectionFont = Font.title2.lowercaseSmallCaps().bold()
    
    var body: some View {
        
        HStack {
            Text("Links")
                .font(sectionFont)
                .padding()
            
            Spacer()
        }
    
        VStack(alignment: .leading) {
            ForEach (links, id: \.self) { link in
                
                if link.hasPrefix("#") {
                    
                    let url = URL(string: "https://www.instagram.com/explore/tags/\(link.dropFirst())")
                    HStack {
                        Image("hashtag")
                            .resizable()
                            .frame(width: 25, height: 25)
                        
                        Link(destination: url!, label: {
                            Text("\(link)")
                                .font(.caption)
                                .lineLimit(1)
                                .truncationMode(.middle)
                        })
                    }
                } else if link.contains("instagram") {
                    let url = URL(string: "\(link)")
                    HStack {
                        Image("instagram")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Link(destination: url!, label: {
                            Text("\(link)")
                                .font(.caption)
                                .lineLimit(1)
                                .truncationMode(.middle)
                        })
                    }
                }
                
                else if link.hasPrefix("http") || link.hasPrefix("www"){
                    let url = URL(string: "\(link)")
                    
                    HStack(alignment: .center) {
                        Image("website")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Link(destination: url!, label: {
                            Text("\(link)")
                                .font(.caption)
                                .lineLimit(1)
                                .truncationMode(.middle)
                        })
                        Spacer()
                    }
                }
                
                else if link.contains("facebook") {
                    let url = URL(string: "\(link)")
                    HStack(spacing: 0) {
                        Image("facebook")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Link(destination: url!, label: {
                            Text("\(link)")
                                .font(.caption)
                                .lineLimit(1)
                                .truncationMode(.middle)
                        })
                    }
                } else {
                    let url = URL(string: "\(link)")
                    HStack(spacing: 0) {
                        
                        Link(destination: url!, label: {
                            Text("\(link)")
                                .font(.caption)
                                .lineLimit(1)
                                .truncationMode(.middle)
                        })
                    }
                    
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    AttractionLinksView(links: ["www.hello.com", "#hellothere", "instagram.com/hello"])
}
