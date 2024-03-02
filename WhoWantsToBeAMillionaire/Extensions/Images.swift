//
//  Images.swift
//  WhoWantsToBeAMillionaire
//
//  Created by  Maksim Stogniy on 27.02.2024.
//
import UIKit.UIImage

extension UIImage {
    enum CluesImage {
        static var clueCall: UIImage? {
            return UIImage(named: "clue-call")
        }
        
        static var clueCallUsed: UIImage? {
            return UIImage(named: "clue-call-used")
        }
        
        static var clueFiftyPercent: UIImage? {
            return UIImage(named: "clue-50-percent")
        }
        
        static var clueFiftyPercentUsed: UIImage? {
            return UIImage(named: "clue-50-percent-used")
        }
        
        static var cluePeopleHelp: UIImage? {
            return UIImage(named: "clue-people-help")
        }
        
        static var cluePeopleHelpUsed: UIImage? {
            return UIImage(named: "clue-people-help-used")
        }
        
        static var clueRightToError: UIImage? {
            return UIImage(named: "clue-right-to-error")
        }
        
        static var clueRightToErrorUsed: UIImage? {
            return UIImage(named: "clue-right-to-error-used")
        }
    }
    
    enum BackgroundImage {
        static var background: UIImage? {
            return UIImage(named: "background")
        }
        
        static var backgroundWithMoney: UIImage? {
            return UIImage(named: "background-with-money")
        }
        
        static var backgroundWithPeople: UIImage? {
            return UIImage(named: "background-with-people")
        }
    }
    
    enum ButtomImage {
        static var buttonRed: UIImage? {
            return UIImage(named: "button-red")
        }
        
        static var buttonBlue: UIImage? {
            return UIImage(named: "button-blue")
        }
        
        static var buttonGreen: UIImage? {
            return UIImage(named: "button-green")
        }
        
        static var buttonGold: UIImage? {
            return UIImage(named: "button-gold")
        }
        
        static var buttonPurple: UIImage? {
            return UIImage(named: "button-purple")
        }
    }
    
    enum LogoImage {
        static var logo: UIImage? {
            return UIImage(named: "logo")
        }
    }
}
