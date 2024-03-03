//
//  LabelFactory.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Sergey on 03.03.2024.
//

import Foundation
import UIKit

protocol ShadowLabel: AnyObject {
    
    var shadowLabel: UILabel {get}
    
}

extension UILabel: ShadowLabel {
    
    var shadowLabel: UILabel {
       return self
    }
    
}

class LabelFactory {
    
    static func createShadowLabel() -> ShadowLabel {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.layer.shadowOffset = CGSize(width: 0, height: 4)
        label.layer.shadowOpacity = 0.9
        label.layer.shadowRadius = 3
        label.layer.shadowColor = UIColor.black.cgColor
        label.textAlignment = .center
        return label
    }
    
}
