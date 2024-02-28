//
//  GameScreenView.swift
//  WhoWantsToBeAMillionaire
//
//  Created by  Maksim Stogniy on 28.02.2024.
//

import Foundation


class GameScreenView: CustomView {
    fileprivate var question: Question?
    
    override func setViews() {
        backgroundColor = .white
    }
    
    override func layoutViews() {
        
    }
    
    func setQuestion(_ question: Question) {
        self.question = question
    }
    
    private func fillQuestionValues(question: Question) {
//        setQuestionLabel(question.)
    }
    
    private func setQuestionLabel(_: String) {
        
    }
    
    private func setQuestionAmount(_: Int) {
        
    }
    
    private func setQuestionNumber(_: Int) {
        
    }
    
    private func setQuestionAnswers(_: [String]) {
        
    }
}
