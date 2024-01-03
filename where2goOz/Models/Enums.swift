//
//  Enums.swift
//  where2goOz
//
//  Created by Steve and Sarah on 3/1/2024.
//

import Foundation

enum CompletionStatus: String, CaseIterable, Identifiable {
    case all, complete, incomplete
    
    var id: Self { self }
}
