//
//  GameOverViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Nikolai Maksimov on 28.02.2024.
//

import UIKit

final class GameOverViewController: CustomViewController<GameOverView> {
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonInit()
    }
    
    private func commonInit() {
        customView.delegate = self
    }
}

// MARK: - GameOverViewDelegate
extension GameOverViewController: GameOverViewDelegate {
    func playAgainButtonPressed(_ button: UIButton) {
        print("Начать игру заново")
    }
}
