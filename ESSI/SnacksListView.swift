//
//  ContentView.swift
//  ESSI
//
//  Created by Robert Beachill on 21/04/2025.
//

import SwiftUI
import SwiftData

struct SnacksListView: View {
    
    @Query var snacks: [Snack]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(snacks) { snack in
                    VStack(alignment: .leading) {
                        NavigationLink {
                            
                        } label: {
                            Text(snack.name)
                        }
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(snack)
                                guard let _ = try? modelContext.save() else {
                                    print("😡 ERROR: Save after .delete on ToDoListView did not work")
                                    return
                                }
                            }
                        }
                        .font(.title)
                        
                        HStack {
                            Text("Qty: \(snack.onHand)")
                                .font(.subheadline)
                                .fontWeight(.bold)
                            Text("\(snack.notes)")
                                .font(.subheadline)
                                .fontWeight(.thin)
                            .lineLimit(1)}
                    }
                }
            }
            .lineLimit(1)
            .listStyle(.plain)
            .navigationTitle(Text("Snacks on Hand:"))
            .navigationBarTitleDisplayMode(.automatic)
        }
        
    }
}

#Preview {
    SnacksListView()
        .modelContainer(Snack.preview)
}
