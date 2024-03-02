//
//  Clues.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Сергей П on 02.03.2024.
//

import UIKit

enum ClueTypes: String, CaseIterable {
    case fifty
    case call
    case help
    case rightToError
    
    var image: UIImage {
        switch self {
        case .fifty:
            return UIImage.CluesImage.clueFiftyPercent ?? UIImage()
        case .call:
            return UIImage.CluesImage.clueCall ?? UIImage()
        case .help:
            return UIImage.CluesImage.cluePeopleHelp ?? UIImage()
        case .rightToError:
            return UIImage.CluesImage.clueRightToError ?? UIImage()
        default:
            return UIImage()
        }
    }
    var imageUsed: UIImage {
        switch self {
        case .fifty:
            return UIImage.CluesImage.clueFiftyPercentUsed ?? UIImage()
        case .call:
            return UIImage.CluesImage.clueCallUsed ?? UIImage()
        case .help:
            return UIImage.CluesImage.cluePeopleHelpUsed ?? UIImage()
        case .rightToError:
            return UIImage.CluesImage.clueRightToErrorUsed ?? UIImage()
        default:
            return UIImage()
        }
    }
}
