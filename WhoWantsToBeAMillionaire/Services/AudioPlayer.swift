//
//  AudioPlayer.swift
//  WhoWantsToBeAMillionaire
//
//  Created by  Maksim Stogniy on 28.02.2024.
//

import AVFoundation


class AudioPlayer {
    private var player: AVAudioPlayer!
    
    private func getURL(_ name: String) -> URL? {
        guard let path = Bundle.main.path(forResource: name, ofType:"mp3") else { return nil }
        return URL(fileURLWithPath: path)
    }
    
    func play(name: String) {
        let url = getURL(name)
        if url == nil {
            return
        }
        
        do {
            player = try! AVAudioPlayer(contentsOf: url!)
            player?.play()
        }
    }
    
    func stop() {
        player?.stop()
    }
}
