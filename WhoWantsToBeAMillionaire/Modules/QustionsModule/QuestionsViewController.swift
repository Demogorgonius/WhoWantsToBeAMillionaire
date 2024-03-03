//
//  QuestionsViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Nikolai Maksimov on 28.02.2024.
//

import UIKit

final class QuestionsViewController: CustomViewController<QuestionsView> {
    
    private let musicService = GameMusicService()
    
    /// индекс текущего вопроса
    private var questionIndex: Int = 0
    
    /// выбор проигрываемой мелодии в зависимости от правильности ответа
    private var isCorrect: Bool
    
    private var progressType: ProgressType
    
    // MARK: Init
    init(number: Int, progressType: ProgressType) {
        self.questionIndex = number
        
        self.progressType = progressType
        switch progressType {
        case .newGame:
            isCorrect = true
            questionIndex = 0
        case .win:
            isCorrect = true
        case .loose:
            isCorrect = false
        case .getMoney:
            isCorrect = true
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if progressType != .newGame {
            playSound()
            changeProgressColor(questionIndex)
        }
        popView()
        
    }
    
    
    func checkUserWin() -> Bool {
        return questionIndex == 14
    }
    
    ///
    private func changeProgressColor(_ index: Int) {
        guard index >= 0 && index <= 14 else {
            print("недопустимый индекс")
            return
        }
        customView.changeBackgroundColor(at: index, type: progressType)
    }
    
    // Активация музыки.
    private func playSound() {
        if progressType == .getMoney {
            return
        }
        
        isCorrect ? musicService.rightAnswer() : musicService.wrongAnswer()
    }
    
    /// возврат на предыдущий экран по истечении 3 секунд
    private func popView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [self] in
            self.musicService.stopPlaying()
            switch self.progressType {
            case .newGame:
                let vc = GameMainViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            case .win:
                if self.checkUserWin() {
                    self.musicService.userWin()
                    self.navigationController?.pushViewController(GameOverViewController(number: self.questionIndex, progressType: self.progressType, amount: self.getCurrentAmount(index: self.questionIndex)), animated: true)
                    return
                }
                
                self.navigationController?.popViewController(animated: true)
            case .loose:
                self.navigationController?.pushViewController(GameOverViewController(number: self.questionIndex, progressType: self.progressType, amount: self.getCurrentAmount(index: self.getProgress())), animated: true)
            case .getMoney:
                self.navigationController?.pushViewController(GameOverViewController(number: self.questionIndex, progressType: self.progressType, amount: self.getCurrentAmount(index: self.questionIndex)), animated: true)
            }
        }
    }
    
    func getCurrentAmount(index: Int) -> Int {
        if (index == -1) {
            return 0
        }
        let indexSum = [100, 200, 300, 500, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 125000, 250000, 500000, 1000000]
        
        return indexSum[index]
    }
    
    func getProgress() -> Int {
        if questionIndex >= 9 {
            return 9
        }
        if questionIndex >= 4 && self.questionIndex < 9 {
            return 4
        }
        return -1
    }
}
