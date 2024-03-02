//
//  QuestionsViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Nikolai Maksimov on 28.02.2024.
//

import UIKit

final class QuestionsViewController: CustomViewController<QuestionsView> {
    
    let musicService = GameMusicService()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func userWin() {
        // If question number is 15 - play user win
        musicService.userWin()
    }
    
}
