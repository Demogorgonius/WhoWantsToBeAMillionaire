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

protocol GameServiceViewProtocol: AnyObject {
    
    func correctAnswerSelect()
    func getMoneySelect()
    func incorrectAnswerSelect()
    func fiftyClue(answers: [String])
    func callClue(answer: Int)
    func helpClue(answers: [Int])
    func oneErrorClue(used: Bool)
    
}

class GameService {
    
    weak var view: GameServiceViewProtocol!
    var questions: [Question] = []
    var questionApi = QuestionsAPI()
    var currentQuestionIndex: Int = 0
    var currentQuestion: GameQuestion?
    var clues = [
        ClueTypes.call: true,
        ClueTypes.fifty: true,
        ClueTypes.help: true
    ] //, Clues.rightToErrorIsAvailable: true]
    var rightToError = true
        
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
        return GameQuestion(text: question.text,
                            answer: ansArray,
                            trueAnswer: ansArray.firstIndex(of: question.correctAnswer) ?? 0)
        
    }
    
    func playerAct(typeOfAction: PlayerAction, answerIndex: Int?, clueType: ClueTypes?) {
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
    
    func getClue(clueType: ClueTypes) {
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
            clues[ClueTypes.fifty] = false
            view.fiftyClue(answers: answerArray)
        case .call:
            guard let currentQuestion else { return }
            let indexTrueAnswer = currentQuestion.trueAnswer
            var indexCall = 0
            
            if Int.random(in: 1...5) != 5 {
                indexCall = indexTrueAnswer
            } else if indexTrueAnswer == 0 {
                indexCall = Int.random(in: 1...3)
            }
            
            clues[ClueTypes.call] = false
            view.callClue(answer: indexCall)
        case .help:
            guard let currentQuestion else { return }
            var percentageGetHelp: [Int] = []
            let indexTrueAnswer = currentQuestion.trueAnswer
            percentageGetHelp[indexTrueAnswer] = 100
            for index in 0...3 {
                
                if index != indexTrueAnswer {
                    
                    percentageGetHelp[index] = Int.random(in: 0..<15)
                    percentageGetHelp[indexTrueAnswer] -= percentageGetHelp[index]
                }
            }
            
            clues[ClueTypes.help] = false
            view.helpClue(answers: percentageGetHelp)
//        case .oneError:
//            
//            rightToError = false
//            view.oneErrorClue(used: true)
        }
    }
    
    func getOneErrorClue(answerIndex: Int?) {
        guard let currentQuestion else { return }
        var answerArray = currentQuestion.answer
        var delCount = 0
        for  index in 0...3 {
            
            if index == currentQuestion.trueAnswer && delCount < 2 {
                
                if Bool.random() {
                    answerArray[index] = ""
                    delCount += 1
                }
            }
        }
    }
}

