//
//  AudioManager.swift
//  meditationTimer
//
//  Created by jeremy on 4/10/25.
//
import AVFoundation

class AudioManager: ObservableObject {
    var audioPlayer: AVAudioPlayer?

    func playSilentAudio() {
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
    }
}


