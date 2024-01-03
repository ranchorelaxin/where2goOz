//
//  FilterSheetView.swift
//  where2goOz
//
//  Created by Steve and Sarah on 3/1/2024.
//

import SwiftUI

struct FilterSheetView: View {
    
    @Binding var completionStatus: CompletionStatus
    
    var body: some View {
        VStack {
            
            Text("Filter Options")
                .font(Font.title.lowercaseSmallCaps())
                .bold()
                .padding(.top)
            
            VStack {
                
                Text("Completion Status")
                    .font(Font.title3.lowercaseSmallCaps())
                    .bold()
                
                Picker("Completion Status", selection: $completionStatus) {
                    ForEach(CompletionStatus.allCases) { status in
                        Text(status.rawValue.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    FilterSheetView(completionStatus: .constant(.all))
}
