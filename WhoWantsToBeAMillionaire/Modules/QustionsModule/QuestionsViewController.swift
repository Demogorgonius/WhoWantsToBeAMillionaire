//
//  QuestionsViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Nikolai Maksimov on 28.02.2024.
//

import UIKit

final class QuestionsViewController<V: QuestionsView>: UIViewController {
    
    
    // MARK: Life Cycle
    override func loadView() {
        view = V()
    }
    
    
    var customView: V {
        view as! V
    }
    
}
