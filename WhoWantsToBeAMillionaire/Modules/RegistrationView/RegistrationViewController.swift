//
//  RegistrationViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Ilya on 28.02.2024.
//

import UIKit
import SnapKit
class RegistrationViewController: CustomViewController<RegistrationView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.delegate = self
    }
}

extension RegistrationViewController: RegistrationViewDelegate {
    func registrationButton(didTapButton button: UIButton) {
        
        let gameMainViewController = GameMainViewController()
        navigationController?.pushViewController(gameMainViewController, animated: true)
    
    }
    
    
}

