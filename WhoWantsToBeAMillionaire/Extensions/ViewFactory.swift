//
//  ViewFactory.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Sergey on 03.03.2024.
//

import Foundation
import UIKit

protocol ShadowGraphView: AnyObject {
    
    var shadowGraphView: UIView {get}
    
}

extension UIView: ShadowGraphView {
    
    var shadowGraphView: UIView {
       return self
    }
    
}


class GraphViewFactory {
    
    let graphSignature = ["A","B","C","D"]
    
    static func createGraphView() -> ShadowGraphView {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowOpacity = 0.9
        view.layer.shadowRadius = 3
        view.layer.shadowColor = UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func getSignature(_ int: Int) -> String {
        
        return graphSignature[int]
    }
    
}
