//
//  CustomViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Sergey on 26.02.2024.
//

import UIKit

class CustomViewController<V: CustomView>: UIViewController {
    
    override func loadView() {
        view = V()
    }
    
    var customView: V {
        view as! V
    }
}
