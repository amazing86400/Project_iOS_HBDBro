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
        
        return Calendar.current.isDate(birthday, equalTo: today, toGranularity: .month) && Calendar.current.isDate(birthday, equalTo: today, toGranularity: .day)
    }
}
