//
//  HBDBroApp.swift
//  HBDBro
//
//  Created by KIBEOM SHIN on 4/20/24.
//

import SwiftUI
import SwiftData

@main
struct HBDBroApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friends.self)
        }
    }
}
