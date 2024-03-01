//
//  SecondVC.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Sergey on 29.02.2024.
//

import Foundation
import UIKit

class SecondVC: UIViewController {

    var curQuestion: Int?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
}




