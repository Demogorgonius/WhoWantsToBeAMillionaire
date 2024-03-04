//
//  GameOverViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Nikolai Maksimov on 28.02.2024.
//

import UIKit

final class GameOverViewController: CustomViewController<GameOverView> {
    
    
    /// индекс текущего вопроса
    private var questionIndex: Int = 0
    private var amount: Int = 0

    private var progressType: ProgressType
    
    private let registrationService = RegistrationUserService()
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setLabels()
        registrationService.setAmountForLastUser(amount)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: Init
    init(number: Int, progressType: ProgressType, amount: Int) {
        self.questionIndex = number
        self.progressType = progressType
        self.amount = amount
       
        
        super.init(nibName: nil, bundle: nil)
    }
    
    func setLabels() {
        let questionString = "вопрос\(getEndingByNumber())"
        switch progressType {
        case .win:
            customView.setLoseTitleLabel("Выигрыш: \(amount) RUB")
            customView.setAttemptTitleLabelText("Вы ответили на 15 \(questionString)")
        case .loose:
            customView.setLoseTitleLabel("Проиграли: \(amount) RUB")
            customView.setAttemptTitleLabelText("Вы ответили на \(questionIndex) \(questionString)")
        case .getMoney:
            customView.setLoseTitleLabel("Вы забрали деньги: \(amount) RUB")
            customView.setAttemptTitleLabelText("Вы ответили на \(questionIndex) \(questionString)")
            break
        case .newGame:
            break
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func getEndingByNumber() -> String {
        switch questionIndex {
        case 1:
            return ""
        case 2...4:
            return "a"
        default:
            return "ов"
        }
    }
}

// MARK: - GameOverViewDelegate
extension GameOverViewController: GameOverViewDelegate {
    func playAgainButtonPressed(_ button: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
