//
//  Item.swift
//  BT2_Buoi3
//
//  Created by Phan Hoang Phuc on 19/3/25.
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
