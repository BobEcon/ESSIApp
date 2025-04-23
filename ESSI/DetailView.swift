//
//  DetailView.swift
//  ESSI
//
//  Created by Robert Beachill on 23/04/2025.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @State var snack: Snack
    @State private var name = ""
    @State private var stepperValue: Int = 1
    @State private var selection = "1 - ✅ Does the job"
    @State private var notes = ""
    let levels = ["1 - ✅ Does the job", "2 - 👍 Solid", "3 - 🤤 Craving Met", "4 - 🧑‍🍳 Gourmet", "5 - 🚨 Emergency"]
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss 
    
    var body: some View {
        List {
            TextField("snack name", text: $name)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                .listRowSeparator(.hidden)
            
            HStack {
                Text("Qty:")
                    .font(.title2)                    .fontWeight(.bold)
                
                Stepper("\(stepperValue)", value: $stepperValue, in: 0...15)
                    .font(.title2)
            }
            .padding(.bottom)
            .listRowSeparator(.hidden)
            
            HStack {
                Text("Comfort Level:")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Picker("", selection: $selection) {
                    ForEach(levels, id: \.self) { level in
                        Text(level)
                    }
                }
                .pickerStyle(.menu)
            }
            .listRowSeparator(.hidden)
            
            Text("Notes:")
                .font(.title2)
                .fontWeight(.bold)

            
            TextField("notes", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
    
        }
        .listStyle(.plain)
        .onAppear() {
            name = snack.name
            stepperValue = snack.onHand
            selection = levels[snack.comfortLevel - 1]
            notes = snack.notes
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    //Move data from local vars to toDo object
                    snack.name = name
                    snack.onHand = stepperValue
                    snack.comfortLevel = levels.firstIndex(of: selection)! + 1
                    snack.notes = notes
                    modelContext.insert(snack)
                    guard let _ = try? modelContext.save() else {
                        print("😡 ERROR: Save in DetailView did not work")
                        return
                    }
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    DetailView(snack: Snack())
        .modelContainer(for: Snack.self, inMemory: true)
}
