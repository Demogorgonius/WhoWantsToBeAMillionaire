//
//  QuestionsViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Nikolai Maksimov on 28.02.2024.
//

import UIKit

enum ProgressType {
    case newGame
    case win
    case loose
}

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
    
    
    func userWin() {
        // If question number is 15 - play user win
        musicService.userWin()
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
        isCorrect ? musicService.rightAnswer() : musicService.wrongAnswer()
    }
    
    /// возврат на предыдущий экран по истечении 3 секунд
    private func popView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.musicService.stopPlaying()
            switch self.progressType {
            case .newGame:
                let vc = GameMainViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            case .win:
                self.navigationController?.popViewController(animated: true)
            case .loose:
                self.navigationController?.pushViewController(GameOverViewController(), animated: true)
            }
        }
    }
}
