//
//  GameScreenViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by  Maksim Stogniy on 29.02.2024.
//

import UIKit

final class GameMainViewController: CustomViewController<GameMainView> {
    
    let musicService = GameMusicService()
    let gameService = GameService()
    var timer: Timer?
    var waitSeconds: Int = 0
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.answerButton?.delegate = self
        customView.clueButton?.delegate = self
        customView.delegate = self
        gameService.view = self
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
        startTimer()
        musicService.waitAnswer()
    }
    
    func goToProgress() {
        let progressController = QuestionsViewController()
        navigationController?.pushViewController(progressController, animated: true)
    }
}

extension GameMainViewController: ClueButtonViewDelegate {
    func clueButtonView(didTapButton button: ClueUIButton, clue: ClueTypes) {
        print("Clue button is pressed: \(clue)")
        gameService.playerAct(typeOfAction: PlayerAction.clue, answerIndex: nil, clueType: clue)
    }
}

extension GameMainViewController: AnswerButtonViewDelegate {
    func answerButtonView(didTapButton button: UIButton) {
        print("Answer button is pressed")
        musicService.answerSelected()
        timer?.invalidate()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            self.gameService.playerAct(typeOfAction: PlayerAction.answer, answerIndex: 0, clueType: nil)
        }
    }
}
extension GameMainViewController: GameMainViewDelegate {
    func gameMainView(didTapButton button: UIButton) {
        print("GetMoney button is pressed")
        gameService.playerAct(typeOfAction: PlayerAction.getMoney, answerIndex: nil, clueType: nil)
    }
}

extension GameMainViewController: GameServiceViewProtocol {
    func correctAnswerSelect() {
        musicService.rightAnswer()
        goToProgress()
    }
    
    func getMoneySelect() {
        musicService.stopPlaying()
        timer?.invalidate()
        goToProgress()
    }
    
    func incorrectAnswerSelect() {
        musicService.wrongAnswer()
        goToProgress()
    }
    
    func fiftyClue(answers: [String]) {
        customView.setQuestionAnswers(answers)
        customView.disableClue(.fifty)
    }
    
    func callClue(answer: Int) {
    }
    
    func helpClue(answers: [Int]) {
    }
    
    func rightToErrorClue(used: Bool) {
    }
    
    func incorrectAnswerHighlight() {
    }
    
    
}
