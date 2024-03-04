//
//  RulesViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Ilya on 29.02.2024.
//

import UIKit

class RulesViewController: CustomViewController<RulesView> {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

}
