//
//  ESSIApp.swift
//  ESSI
//
//  Created by Robert Beachill on 21/04/2025.
//

import SwiftUI
import SwiftData

@main
struct ESSIApp: App {
    var body: some Scene {
        WindowGroup {
            SnacksListView()
                .modelContainer(for: Snack.self)
        }
    }
}
