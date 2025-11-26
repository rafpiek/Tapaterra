//
//  Item.swift
//  Tapaterra
//
//  Created by Rafał Piekara on 26/11/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
