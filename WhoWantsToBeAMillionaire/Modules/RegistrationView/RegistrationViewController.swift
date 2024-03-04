//
//  RegistrationViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Ilya on 28.02.2024.
//

import UIKit
import SnapKit

class RegistrationViewController: CustomViewController<RegistrationView> {
    let registrationUserService = RegistrationUserService()
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
}

extension RegistrationViewController: RegistrationViewDelegate {    
    func registrationButton(didTapButton button: UIButton, userName: String) {
        registrationUserService.saveUser(name: userName, amount: 0)
        let progVC = QuestionsViewController(number: 0, progressType: .newGame)
        navigationController?.pushViewController(progVC, animated: true)
    }
}

