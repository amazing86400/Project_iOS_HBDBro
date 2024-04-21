//
//  Friend.swift
//  HBDBro
//
//  Created by KIBEOM SHIN on 4/20/24.
//

import Foundation
import SwiftData

@Model
class Friends {
    let name: String
    let birthday: Date
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
    
    var isBirthday: Bool {
        let today = Date()
        let calendar = Calendar.current
        let components: Set<Calendar.Component> = [.month, .day]
        let todayComponents = calendar.dateComponents(components, from: today)
        let friendComponents = calendar.dateComponents(components, from: birthday)
        
        return todayComponents.month == friendComponents.month && todayComponents.day == friendComponents.day
    }
}
