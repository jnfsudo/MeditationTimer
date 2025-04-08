//
//  ContentView.swift
//  meditationTimer
//
//  Created by jeremy on 4/7/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var timeRemaining = 60 //set initial timer duration
    @State private var timerRunning = false
    @State private var timer: Timer?
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        VStack{
            Text("Meditation Timer")
            Text("\(timeRemaining)")
                .font(.largeTitle)
                .padding()
            HStack {
                Button(timerRunning ? "Pause" : "Start") {
                    if timerRunning {
                        stopTimer()
                    } else{
                        startTimer()
                    }
                }
                .padding()
                
                Button("Reset") {
                    resetTimer()
                }
                .padding()
                
            }
        }
    }
    func startTimer(){
        timerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            }else {
                stopTimer()
            }
        }
    }
    func stopTimer() {
        timerRunning = false
        timer?.invalidate()
    }
    func resetTimer(){
        stopTimer()
        timeRemaining = 60 //reset to initial value
    }
    
    
    /*    private func addItem() {
     withAnimation {
     let newItem = Item(timestamp: Date())
     modelContext.insert(newItem)
     }
     }
     
     private func deleteItems(offsets: IndexSet) {
     withAnimation {
     for index in offsets {
     modelContext.delete(items[index])
     }
     }
     }
     }
     
     
     #Preview {
     ContentView()
     .modelContainer(for: Item.self, inMemory: true)
     }*/
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
