//
//  Question.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Сергей П on 28.02.2024.
//

import Foundation
struct QuestionModel: Codable {
    var results: [Question]?
}

struct Question: Codable {
    let type: String
    let difficulty: String
    let category: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    
    
    init(t: String, d: String, c: String, q: String, cA: String, iA: [String]) {
        type = t
        difficulty = d
        category = c
        question = q.replacingOccurrences(of: "&quot", with: "\"")
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
