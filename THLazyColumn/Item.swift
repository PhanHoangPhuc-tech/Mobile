//
//  Item.swift
//  THLazyColumn
//
//  Created by Phan Hoang Phuc on 25/3/25.
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
