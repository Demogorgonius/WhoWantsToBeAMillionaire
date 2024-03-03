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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customView.setDefaultButtonsState()
        customView.updateCluesState(state: gameService.cluesAvailability)
        setQuestion()
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
            incorrectAnswerSelect()
        }
        customView.updateTimerLabel(waitSeconds)
    }
    
    func waitForAnswer() {
        waitSeconds = 30
        startTimer()
        musicService.waitAnswer()
    }
    
    func goToProgress(_ type: ProgressType) {
        let progressController = QuestionsViewController(number: gameService.currentQuestionIndex - 1, progressType: type)
        navigationController?.pushViewController(progressController, animated: true)
    }
    
    func setQuestion() {
        customView.setQuestion(gameService.getQuestion())
    }
    
}

extension GameMainViewController: ClueButtonViewDelegate {
    func clueButtonView(didTapButton button: ClueUIButton) {
        button.useClue()
        gameService.playerAct(typeOfAction: PlayerAction.clue, answerIndex: nil, clueType: button.clue)
    }
}

extension GameMainViewController: AnswerButtonViewDelegate {
    func answerButtonView(didTapButton button: UIButton) {
        print("Answer button is pressed")
        button.setBackgroundImage(UIImage.ButtomImage.buttonGreen, for: .normal)
        button.startFlick()
        customView.disableButtons(false)
        musicService.answerSelected()
        timer?.invalidate()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            self.gameService.playerAct(typeOfAction: PlayerAction.answer, answerIndex: button.tag, clueType: nil)
            self.customView.disableButtons(true)
            button.stopFlick()
            self.customView.updateCluesState(state: self.gameService.cluesAvailability)
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
        musicService.stopPlaying()
        goToProgress(.win)
    }
    
    func getMoneySelect() {
        musicService.stopPlaying()
        timer?.invalidate()
        goToProgress(.getMoney)
    }
    
    func incorrectAnswerSelect() {
        musicService.stopPlaying()
        goToProgress(.loose)
    }
    
    func fiftyClue(answers: [String]) {
        customView.setQuestionAnswers(answers)
        customView.disableEmptyAnswers()
    }
    
    func callClue(answer: Int) {
        customView.highlightAnswer(answer)
    }
    
    func helpClue(answers: [Int]) {
        customView.showGraphView(precent: answers)
    }
    
    func incorrectAnswerHighlight(answer: Int) {
        customView.highlightAnswer(answer)
        customView.disableAnswer(answer)
        waitForAnswer()
    }
    
}

