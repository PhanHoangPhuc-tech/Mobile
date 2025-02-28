//
//  Item.swift
//  BT1
//
//  Created by Phan Hoang Phuc on 28/2/25.
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
