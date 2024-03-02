//
//  UIButton.swift
//  WhoWantsToBeAMillionaire
//
//  Created by  Maksim Stogniy on 02.03.2024.
//
import UIKit

extension UIButton {
    func startFlick() {
        animateButton()
    }
    
    private func animateButton() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            options: [.repeat, .autoreverse],
            animations: {
                self.alpha = 0.0
            },
            completion: nil
        )
    }
    
    func stopFlick() {
        layer.removeAllAnimations()
        self.alpha = 1.0
    }
    
}
