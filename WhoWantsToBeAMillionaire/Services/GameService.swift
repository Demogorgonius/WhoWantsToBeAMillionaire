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
    let index: Int
    let sum: String
}

enum PlayerAction {
    case answer
    case getMoney
    case clue
}

let indexSum = [100, 200, 300, 500, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 125000, 250000, 500000, 1000000]

protocol GameServiceViewProtocol: AnyObject {
    
    func correctAnswerSelect()
    func getMoneySelect()
    func incorrectAnswerSelect()
    func incorrectAnswerHighlight(answer: Int)
    func fiftyClue(answers: [String])
    func callClue(answer: Int)
    func helpClue(answers: [Int])
    func rightToErrorClue(used: Bool)
    
}

class GameService {
    
    weak var view: GameServiceViewProtocol!
    var questions: [Question] = []
    var questionApi = QuestionsAPI()
    var currentQuestionIndex: Int = 0
    var currentQuestion: GameQuestion?
    var currentAnswerButtonIndex: Int = 0
    var clues = [
        ClueTypes.call: true,
        ClueTypes.fifty: true,
        ClueTypes.help: true,
        ClueTypes.rightToError: true]
    var rightToErrorSelect = false
        
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
                            trueAnswer: ansArray.firstIndex(of: question.correctAnswer) ?? 0,
                            index: currentQuestionIndex + 1,
                            sum: makeSum()
                            )
    }
    
    func makeSum() -> String {
        let sumInt = indexSum[currentQuestionIndex]
        let sumString = String(sumInt) + " RUB"
        return sumString
    }
    
    func playerAct(typeOfAction: PlayerAction, answerIndex: Int?, clueType: ClueTypes?) {
        switch typeOfAction {
        case .answer:
            guard let answerIndex else { return }
            if answerIndex == currentQuestion?.trueAnswer {
                view.correctAnswerSelect()
            } else if rightToErrorSelect == true {
                view.incorrectAnswerHighlight(answer: answerIndex)
                rightToErrorSelect = false
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
            for  index in Array(0...3).shuffled() {
                
                if index != currentQuestion.trueAnswer && delCount < 2 {
                    answerArray[index] = ""
                    delCount += 1
                }
            }
            clues[ClueTypes.fifty] = false
            view.fiftyClue(answers: answerArray)
        case .call:
            guard let currentQuestion else { return }
            let indexTrueAnswer = currentQuestion.trueAnswer
            var indexCall = 0
            
            if Int.random(in: 0..<100) < 80 {
                indexCall = indexTrueAnswer
            } else {
                var indexes = Array(0...3)
                indexes.remove(at: indexTrueAnswer)
                indexCall = indexes.randomElement()!
            }
            
            clues[ClueTypes.call] = false
            view.callClue(answer: indexCall)
        case .help:
            guard let currentQuestion else { return }
            var percentageGetHelp: [Int] = [0,0,0,0]
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
        case .rightToError:
            rightToErrorSelect = true
            clues[ClueTypes.rightToError] = false
            view.rightToErrorClue(used: true)
        }
    }
    
}

