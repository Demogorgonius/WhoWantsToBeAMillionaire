//
//  GameOverViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Nikolai Maksimov on 28.02.2024.
//

import UIKit


final class GameOverViewController<V: GameOverView>: UIViewController {
    
    // MARK: Life Cycle
    override func loadView() {
        view = V()
    }
    
    
    var customView: V {
        view as! V
    }
}
