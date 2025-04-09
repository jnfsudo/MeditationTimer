//
//  ContentView.swift
//  meditationTimer
//
//  Created by jeremy on 4/7/25.
//

import SwiftUI
import SwiftData
import AudioToolbox
let dateformatter = DateFormatter()

struct ContentView: View {
    @State private var timeRemaining = 600 //set initial timer duration
    @State private var timerRunning = false
    @State private var timer: Timer?
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        VStack{
            Text("Meditation Timer")
            Text(timeFormatted(timeRemaining))
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
        let startTime = Date()
        //let startTimeString = dateformatter.string(from: startTime)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            }else {
                vibrateEnd()
                let endTime = Date()
                //let endTimeString = dateformatter.string(from: startTime)
                let duration = timeFormatted(Int(endTime.timeIntervalSince(startTime)))
                /*add in data saving here for;
                 startTimeString endTimeString and duration?*/
                print(duration)
            }
        }
    }
    func stopTimer() {
        timerRunning = false
        timer?.invalidate()
    }
    func resetTimer(){
        stopTimer()
        timeRemaining = 600 //reset to initial value
    }
    func timeFormatted(_ totalSeconds: Int) -> String {
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    func vibrateEnd(){
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        stopTimer()
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
