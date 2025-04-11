//
//  ContentView.swift
//  meditationTimer
//
//  Created by jeremy on 4/7/25.
//

import SwiftUI
import SwiftData
/*import AudioToolbox
import AVFoundation
let dateformatter = DateFormatter()*/

struct ContentView: View {
    /*@State private var timeRemaining = 600 //set initial timer duration
    @State private var timerRunning = false
    @State private var timer: Timer?*/
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    //var audioPlayer: AVAudioPlayer?
    @StateObject var audioManager = AudioManager()
    @StateObject var timeDate = TimerCLass()
    
    var body: some View {
        VStack{
            Text("Meditation Timer")
            Text(timeDate.timeFormatted(timeDate.timeRemaining))
                .font(.largeTitle)
                .padding()
            HStack {
                Button(timeDate.timerRunning ? "Pause" : "Start") {
                    if timeDate.timerRunning {
                        timeDate.stopTimer()
                    } else{
                        timeDate.startTimer()
                    }
                }
                .padding()
                
                Button("Reset") {
                    timeDate.resetTimer()
                }
                .padding()
                
            }
        }
    }
    /*func startTimer(){
        timerRunning = true
        let startTime = Date()
        //let startTimeString = dateformatter.string(from: startTime)
        audioManager.playSilentAudio()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            }else {
                vibrateEnd()
                audioManager.playBell()
                let endTime = Date()
                //let endTimeString = dateformatter.string(from: startTime)
                let duration = timeFormatted(Int(endTime.timeIntervalSince(startTime)))
                /*add in data saving here for;
                 startTimeString endTimeString and duration?*/
                print(duration)
            }
        }
    }*/
    
    /*func playSilentAudio() {
        guard let path = Bundle.main.path(forResource: "silence", ofType: "mp3") else {
            print("Silent audio file not found")
            return
        }

        let url = URL(fileURLWithPath: path)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1  // Infinite loop
            audioPlayer?.play()
        } catch {
            print("Error playing silent audio: \(error.localizedDescription)")
        }
    }
    func stopSilentAudio() {
        audioPlayer?.stop()
    }*/
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
