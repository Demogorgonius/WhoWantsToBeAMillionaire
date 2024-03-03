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
            "100 RUB"
        case .two:
            "200 RUB"
        case .three:
            "300 RUB"
        case .four:
            "500 RUB"
        case .five:
            "1000 RUB"
        case .six:
            "2000 RUB"
        case .seven:
            "4000 RUB"
        case .eight:
            "8000 RUB"
        case .nine:
            "16000 RUB"
        case .ten:
            "32000 RUB"
        case .eleven:
            "64000 RUB"
        case .twelve:
            "125000 RUB"
        case .thirteen:
            "250000 RUB"
        case .fourteen:
            "500000 RUB"
        case .fifteen:
            "1 Миллион"
        }
    }
    
    var image: UIImage {
        switch self {
        case .five, .ten, .fifteen:
            return UIImage.ButtomImage.buttonBlue ?? UIImage()
        default:
            return UIImage.ButtomImage.buttonPurple ?? UIImage()
        }
    }
}
