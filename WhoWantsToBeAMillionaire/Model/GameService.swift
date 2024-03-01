//
//  GameService.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Сергей П on 29.02.2024.
//

import Foundation

struct GameQuestion {
    
    let text: String
    let answer: [String]
    let trueAnswer: Int
    
}

enum PlayerAction {
    case answer
    case getMoney
    case clue
}

enum ClueType {
    case fifty
    case call
    case help
}



protocol GameServiceViewProtocol: AnyObject {
    
    func correctAnswerSelect()
    func getMoneySelect()
    func incorrectAnswerSelect()
    func fiftyClue(answer: [String])
    
}

class GameService {
    
    weak var view: GameServiceViewProtocol!
    var questions: [Question] = []
    var questionApi = QuestionsAPI()
    var currentQuestionIndex: Int = 0
    var currentQuestion: GameQuestion?
    var rightToError: Bool = true
    
    init() {
        questions = questionApi.fetchData()
    }
    
    func getQuestion() -> GameQuestion{
        
        let question = makeQuestion(questions[currentQuestionIndex])
        currentQuestion = question
        if currentQuestionIndex < questions.count {
            currentQuestionIndex += 1
            
        } else {
            currentQuestionIndex = 0
        }
        return question
    }
    
    func makeQuestion(_ question: Question) -> GameQuestion {
        
        var ansArray: [String] = question.incorrectAnswers
        ansArray.append(question.correctAnswer)
        ansArray.shuffle()
        return GameQuestion(text: question.question,
                             answer: ansArray,
                             trueAnswer: ansArray.firstIndex(of: question.correctAnswer) ?? 0)
 
    }
    
    func playerAct(typeOfAction: PlayerAction, answerIndex: Int?, clueType: ClueType?) {
        switch typeOfAction {
        case .answer:
            guard let answerIndex else { return }
            if answerIndex == currentQuestion?.trueAnswer {
                view.correctAnswerSelect()
            } else {
                view.incorrectAnswerSelect()
            }
        case .getMoney:
            view.getMoneySelect()
        case .clue:
            if let clueType = clueType {
                getClue(clueType: clueType)
            }
        }
    }
    
    func getClue(clueType: ClueType) {
        switch clueType {
        case .fifty:
            guard let currentQuestion else { return }
            var answerArray = currentQuestion.answer
            var delCount: Int = 0
            for  index in 0...3 {
                
                if index != currentQuestion.trueAnswer && delCount < 2 {
                    
                    if Bool.random() {
                        answerArray[index] = ""
                        delCount += 1
                    }
                }
            }
            view.fiftyClue(answer: answerArray)
        case .call:
            return
        case .help:
            return
        }
        
        
        
        
        
    }

//    var quizAPI = QuestionsAPI().quiz
//    var questionNumber = 0
//    
//    var question = ""
//    var incorrectAnswers: [String] = []
//    var correctAnswer = ""
//    var answers: [String] = []
//    var answerOne = ""
//    var answerTwo = ""
//    var answerTree = ""
//    var answerFour = ""
//    var userAnswer = ""
    
//    func linkAnswers() {
//        incorrectAnswers = quizAPI[questionNumber].incorrectAnswers
//        correctAnswer = quizAPI[questionNumber].coorectAnswer
//        answers = incorrectAnswers
//        answers.append(correctAnswer)
//    }
    
//    func showScreen() {
//        question = quizAPI[questionNumber].question
//        answerOne = answers[0]
//        answerTwo = answers[1]
//        answerTree = answers[2]
//        answerFour = answers[3]
//    }
//    
//    func checkAnswers(_ userAnswer: String) -> Bool {
//        if userAnswer == correctAnswer {
//            questionNumber += 1
//            return true
//        } else {
//            return false
//        }
//    }
    
}
