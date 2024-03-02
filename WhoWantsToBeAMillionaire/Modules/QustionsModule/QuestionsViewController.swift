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
    
    // MARK: Init
    init(number: Int, isCorrect: Bool) {
        self.questionIndex = number
        self.isCorrect = isCorrect
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func userWin() {
        // If question number is 15 - play user win
        musicService.userWin()
    }
    
    // Запуск музыки зависимо от значения true/false
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        playSound()
        popView()
    }
    
    // Активация музыки.
    private func playSound() {
        isCorrect ? musicService.rightAnswer() : musicService.wrongAnswer()
    }
    
    /// возврат на предыдущий экран по истечении 3 секунд
    private func popView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.musicService.stopPlaying()
            self.navigationController?.popViewController(animated: true)
        }
    }
}
