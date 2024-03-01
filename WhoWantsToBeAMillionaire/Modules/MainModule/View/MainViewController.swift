//
//  MainViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Sergey on 26.02.2024.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    let gameService = GameService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    
    
}

extension MainViewController: GameServiceViewProtocol {
    func correctAnswerSelect() {
        
        let vc = SecondVC()
        vc.curQuestion = gameService.currentQuestionIndex
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func getMoneySelect() {
        
    }
    
    func incorrectAnswerSelect() {
        
    }
    
    func fiftyClue(answer: [String]) {
        
    }
    
    
}
