//
//  GameMusicService.swift
//  WhoWantsToBeAMillionaire
//
//  Created by  Maksim Stogniy on 02.03.2024.
//

class GameMusicService {
    let player = AudioPlayer()
    
    func waitAnswer() {
        player.play(name: Sounds.waitUserAnswer)
    }
    
    func rightAnswer() {
        player.play(name: Sounds.rightAnswer)
    }
    
    func wrongAnswer() {
        player.play(name: Sounds.wrongAnswer)
    }
    
    func userWin() {
        player.play(name: Sounds.userWin)
    }
    
    func answerSelected() {
        player.play(name: Sounds.answerAccepted)
    }
    
    func stopPlaying() {
        player.stop()
    }
}
