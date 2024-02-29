//
//  Fonts.swift
//  WhoWantsToBeAMillionaire
//
//  Created by  Maksim Stogniy on 27.02.2024.
//

import UIKit.UIFont

extension UIFont {
    enum SystemFonts {
        enum Syne {
            static let regular = "Syne-Regular"
        }
        
        enum Roboto {
            static let regular = "Roboto-Regular"
            static let medium = "Roboto-Medium"
            static let bold = "Roboto-Bold"
            static let semibold = "Roboto-Semibold"
        }
    }
    
    enum SyneFont {
        enum Regular {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: SystemFonts.Syne.regular, size: size) ?? UIFont()
            }
        }
    }
    
    enum RobotoFont {
        enum Regular {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: SystemFonts.Roboto.regular, size: size) ?? UIFont()
            }
        }
        
        enum Medium {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: SystemFonts.Roboto.medium, size: size) ?? UIFont()
            }
        }
        
        enum Bold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: SystemFonts.Roboto.bold, size: size) ?? UIFont()
            }
        }
        
        enum SemiBold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: SystemFonts.Roboto.semibold, size: size) ?? UIFont()
            }
        }
    }
    
    enum TextFont {
        enum Buttons {
            static let questionListButton = RobotoFont.Regular.size(of: 20)
            static let answerButtonLetter = RobotoFont.Medium.size(of: 24)
            static let answerButtonText = RobotoFont.Medium.size(of: 20)
        }
        
        enum Welcome {
            static let label = RobotoFont.Regular.size(of: 24)
            static let logo = RobotoFont.Bold.size(of: 36)
            static let menuItem = RobotoFont.Bold.size(of: 32)
        }
        
        enum Registration {
            static let label = RobotoFont.Bold.size(of: 28)
            static let input = RobotoFont.Bold.size(of: 28)
            static let button = RobotoFont.Bold.size(of: 24)
        }
        
        enum Question {
            static let text = RobotoFont.Medium.size(of: 24)
            static let label = RobotoFont.Medium.size(of: 24)
            static let amount = RobotoFont.Medium.size(of: 24)
        }
        
        enum Lose {
            static let label = RobotoFont.Medium.size(of: 24)
            static let button = RobotoFont.Medium.size(of: 36)
            static let text = SyneFont.Regular.size(of: 50)
        }
    }
}
