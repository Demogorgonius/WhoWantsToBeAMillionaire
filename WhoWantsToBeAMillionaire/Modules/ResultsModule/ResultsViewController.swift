//
//  ResultsViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Ilya on 02.03.2024.
//

import UIKit

class ResultsViewController: CustomViewController<ResultsView> {
    let registrationUserService = RegistrationUserService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.setUsersData(registrationUserService.loadUsers())
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
}
