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
//    case rightToErrorIsAvailable = "rightToErrorIsAvailable"
    
    var image: UIImage {
        switch self {
        case .fifty:
            return UIImage.CluesImage.clueFiftyPercent ?? UIImage()
        case .call:
            return UIImage.CluesImage.clueCall ?? UIImage()
        case .help:
            return UIImage.CluesImage.cluePeopleHelp ?? UIImage()
//        default:
//            return UIImage.ButtomImage.buttonPurple ?? UIImage()
        }
    }
}
