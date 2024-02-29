//
//  GameService.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Сергей П on 29.02.2024.
//

import Foundation

class GameService {
    
    var quizAPI = QuestionsAPI().quiz
    var questionNumber = 0
    
    var question = ""
    var incorrectAnswers: [String] = []
    var correctAnswer = ""
    var answers: [String] = []
    var answerOne = ""
    var answerTwo = ""
    var answerTree = ""
    var answerFour = ""
    var userAnswer = ""
    
    func linkAnswers() {
        incorrectAnswers = quizAPI[questionNumber].incorrectAnswers
        correctAnswer = quizAPI[questionNumber].coorectAnswer
        answers = incorrectAnswers
        answers.append(correctAnswer)
    }
    
    func showScreen() {
        question = quizAPI[questionNumber].question
        answerOne = answers[0]
        answerTwo = answers[1]
        answerTree = answers[2]
        answerFour = answers[3]
    }
    
    func checkAnswers(_ userAnswer: String) -> Bool {
        if userAnswer == correctAnswer {
            questionNumber += 1
            return true
        } else {
            return false
        }
    }
    
}
