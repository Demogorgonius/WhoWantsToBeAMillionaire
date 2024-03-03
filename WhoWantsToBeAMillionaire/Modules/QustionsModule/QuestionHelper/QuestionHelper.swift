//
//  QuestionHelper.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Nikolai Maksimov on 28.02.2024.
//

import UIKit

enum QuestionHelper: String, CaseIterable {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case eleven = "11"
    case twelve = "12"
    case thirteen = "13"
    case fourteen = "14"
    case fifteen = "15"
    
    var price: String {
        switch self {
        case .one:
            "100 руб"
        case .two:
            "200 руб"
        case .three:
            "300 руб"
        case .four:
            "500 руб"
        case .five:
            "1000 руб"
        case .six:
            "2000 руб"
        case .seven:
            "4000 руб"
        case .eight:
            "8000 руб"
        case .nine:
            "16000 руб"
        case .ten:
            "32000 руб"
        case .eleven:
            "64000 руб"
        case .twelve:
            "125000 руб"
        case .thirteen:
            "250000 руб"
        case .fourteen:
            "500000 руб"
        case .fifteen:
            "1 Миллион"
        }
    }
    
    var image: UIImage {
        switch self {
        case .five, .ten:
            return UIImage.ButtomImage.buttonBlue ?? UIImage()
        case .fifteen:
            return UIImage.ButtomImage.buttonGold ?? UIImage()
        default:
            return UIImage.ButtomImage.buttonPurple ?? UIImage()
        }
    }
}
