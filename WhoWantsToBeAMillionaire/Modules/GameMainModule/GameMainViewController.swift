//
//  GameScreenViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by  Maksim Stogniy on 29.02.2024.
//

import UIKit

final class GameMainViewController: CustomViewController<GameMainView> {
    
    let musicService = GameMusicService()
    var timer: Timer?
    var waitSeconds: Int = 0
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.answerButton?.delegate = self
        customView.clueButton?.delegate = self
        customView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        waitForAnswer()
    }
    
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(
                   timeInterval: 1.0,
                   target: self,
                   selector: #selector(countDown),
                   userInfo: nil,
                   repeats: true)
    }
    
    @objc func countDown() {
        if waitSeconds > 0 {
            waitSeconds -= 1
        }
        
        if (waitSeconds == 0) {
            timer?.invalidate()
            musicService.stopPlaying()
        }
        customView.updateTimerLabel(waitSeconds)
    }
    
    func waitForAnswer() {
        waitSeconds = 30
        
        customView.switchTimerHidden(false)
        startTimer()
        musicService.waitAnswer()
    }
    
    func goToProgress() {
        
        
        let progressController = QuestionsViewController()
        navigationController?.pushViewController(progressController, animated: true)
    }
}

extension GameMainViewController: ClueButtonViewDelegate {
    func clueButtonView(didTapButton button: UIButton) {
        print("Clue button is pressed")
    }
}

extension GameMainViewController: AnswerButtonViewDelegate {
    func answerButtonView(didTapButton button: UIButton) {
        waitSeconds = 5
        startTimer()
        print("Answer button is pressed")
        musicService.answerSelected()
        customView.switchTimerHidden(true)
        
        //Check answer and navigate to progress or game over
        let isAnswerCorrect = true
        if (isAnswerCorrect) {
            musicService.rightAnswer()
        } else {
            musicService.wrongAnswer()
        }
        goToProgress()
    }
}
extension GameMainViewController: GameMainViewDelegate {
    func gameMainView(didTapButton button: UIButton) {
        print("GetMoney button is pressed")
        musicService.stopPlaying()
        timer?.invalidate()
        goToProgress()
    }
}
