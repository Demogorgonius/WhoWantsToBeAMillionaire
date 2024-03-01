//
//  GameScreenViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by  Maksim Stogniy on 29.02.2024.
//

import UIKit

final class GameMainViewController: CustomViewController<GameMainView> {

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.answerButton?.delegate = self
        customView.clueButton?.delegate = self
        customView.delegate = self

    }
}

extension GameMainViewController: ClueButtonViewDelegate {
    func clueButtonView(didTapButton button: UIButton) {
        print("Clue button is pressed")
    }
}

extension GameMainViewController: AnswerButtonViewDelegate {
    func answerButtonView(didTapButton button: UIButton) {
        print("Answer button is pressed")
    }
}
extension GameMainViewController: GameMainViewDelegate {
    func gameMainView(didTapButton button: UIButton) {
        print("GetMoney button is pressed")
    }
}
