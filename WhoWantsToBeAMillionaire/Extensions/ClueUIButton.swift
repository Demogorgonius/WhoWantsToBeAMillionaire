//
//  UIButton + Extension.swift
//  WhoWantsToBeAMillionaire
//
//  Created by  Maksim Stogniy on 02.03.2024.
//
import UIKit.UIButton
import UIKit.UIImage

class ClueUIButton: UIButton {
    var clue: ClueTypes?
    var isPressed: Bool?
    
    func useClue() {
        self.isPressed = true
        self.isEnabled = false
        self.updateState()
    }
    
    private func updateState() {
        var image = clue?.image
        if isPressed! {
            image = clue?.imageUsed
        }

        setBackgroundImage(image ?? UIImage(), for: .normal)
    }
}
