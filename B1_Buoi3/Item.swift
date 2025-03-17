//
//  Item.swift
//  B1_Buoi3
//
//  Created by Phan Hoang Phuc on 18/3/25.
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
