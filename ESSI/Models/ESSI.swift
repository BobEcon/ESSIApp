//
//  Untitled.swift
//  ESSI
//
//  Created by Robert Beachill on 21/04/2025.
//

import Foundation
import SwiftData

@MainActor
@Model
class Snack {
    var name = ""
    var onHand = 0
    var notes = ""
    var comfortLevel = 1
    
    init(name: String = "", onHand: Int = 0, notes: String = "", comfortLevel: Int = 1) {
        self.name = name
        self.onHand = onHand
        self.notes = notes
        self.comfortLevel = comfortLevel
    }
}

extension Snack {
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: Snack.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        // Add Mock Data
        container.mainContext.insert(Snack(name: "Cheddar Goldfish",
                                           onHand: 3,
                                           notes: "Best eaten by the handful while doomscrolling.",
                                           comfortLevel: 1))
        container.mainContext.insert(Snack(name: "Spicy Takis",
                                           onHand: 1,
                                           notes: "Left lips numb last time. No regrets.",
                                           comfortLevel: 2))
        container.mainContext.insert(Snack(name: "Frozen Thin Mints",
                                           onHand: 3,
                                           notes: "A classy cold snack. Seasonal, like depression.",
                                           comfortLevel: 1))
        container.mainContext.insert(Snack(name: "Trader Joe’s Scandinavian Swimmers",
                                           onHand: 2,
                                           notes: "Pretends to be healthy. Not fooling anyone.",
                                           comfortLevel: 3))
        container.mainContext.insert(Snack(name: "Mom's Cookies",
                                           onHand: 1,
                                           notes: "Nothing better. Like a warm blanket",
                                           comfortLevel: 5))
        
        return container
    }
}
