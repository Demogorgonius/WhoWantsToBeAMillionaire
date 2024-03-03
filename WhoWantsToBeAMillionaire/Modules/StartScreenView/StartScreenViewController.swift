//
//  StartScreenViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Ilya on 28.02.2024.
//

import UIKit
import SnapKit



class StartScreenViewController: CustomViewController<StartScreenView> {
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        customView.delegate = self
    }
    
    
    
}

extension StartScreenViewController: StartScreenViewDelegate {
    
    func rulesButton(didTapButton button: UIButton) {
        
        let rulesController = RulesViewController()
        navigationController?.pushViewController(rulesController, animated: true)
    }
    
    func startGameButton(didTapButton button: UIButton) {
        
        let registrationController = RegistrationViewController()
        navigationController?.pushViewController(registrationController, animated: true)
    }
    
    func statButton(didTapButton button: UIButton) {
        
        let resultsController = ResultsViewController()
        navigationController?.pushViewController(resultsController, animated: true)
    }
    
}
