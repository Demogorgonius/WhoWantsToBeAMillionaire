//
//  Question.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Сергей П on 28.02.2024.
//

import Foundation

struct Question {
    var type: String
    var difficulty: String
    var category: String
    var text: String
    var correctAnswer: String
    var incorrectAnswers: [String]
    
    init(t: String, d: String, c: String, q: String, cA: String, iA: [String]) {
        type = t
        difficulty = d
        category = c
        text = q
        correctAnswer = cA
        incorrectAnswers = iA
    }
    
    func getAnswers() -> [String] {
        var answers = [correctAnswer] + incorrectAnswers
        return answers.shuffled()
    }
}
