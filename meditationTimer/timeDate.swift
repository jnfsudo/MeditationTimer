//
//  timer.swift
//  meditationTimer
//
//  Created by jeremy on 4/11/25.
//
import AudioToolbox
import AVFoundation
let dateformatter = DateFormatter()
var audioManager = AudioManager()


class TimerCLass: ObservableObject  {
    @Published var timeRemaining = 600 //set initial timer duration
    @Published var timerRunning = false
    private var timer: Timer?
    
    
    func startTimer(){
        timerRunning = true
        let startTime = Date()
        //let startTimeString = dateformatter.string(from: startTime)
        //audioManager.playSilentAudio()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }else {
                self.vibrateEnd()
                audioManager.playBell()
                let endTime = Date()
                //let endTimeString = dateformatter.string(from: startTime)
                let duration = self.timeFormatted(Int(endTime.timeIntervalSince(startTime)))
                /*add in data saving here for;
                 startTimeString endTimeString and duration?*/
                print(duration)
            }
        }
    }
    
    func stopTimer() {
            timerRunning = false
            audioManager.stopSilentAudio()
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
