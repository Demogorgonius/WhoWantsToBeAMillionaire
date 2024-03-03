//
//  Question.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Сергей П on 28.02.2024.
//

import Foundation
struct QuestionModel: Codable {
    var questions: [Question]?
}

struct Question: Codable, Equatable {
    let type: String
    let difficulty: String
    let category: String
    let text: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    
    init(t: String, d: String, c: String, q: String, cA: String, iA: [String]) {
        type = t
        difficulty = d
        category = c
        text = q
        correctAnswer = cA
        incorrectAnswers = iA
    }
    
    func getData() {
        
    }
    func getAnswers() -> [String] {
        let answers = [correctAnswer] + incorrectAnswers
        return answers.shuffled()
    }
}
