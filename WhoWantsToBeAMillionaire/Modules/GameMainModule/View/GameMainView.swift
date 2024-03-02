//
//  GameScreenView.swift
//  WhoWantsToBeAMillionaire
//
//  Created by  Maksim Stogniy on 28.02.2024.
//

import UIKit
import SnapKit


protocol GameMainViewDelegate: AnyObject {
    func gameMainView(didTapButton button: UIButton)
}

class GameMainView: CustomView {
    var answerButton: AnswerButtonView?
    var clueButton: ClueButtonView?
    weak var delegate: GameMainViewDelegate?
    
    fileprivate var question: Question?
    
    private lazy var backgroundImageView = makeImageView(
        image: UIImage.BackgroundImage.backgroundWithPeople ?? UIImage()
    )
    
    private lazy var logoImageView = makeImageView(
        image: UIImage.LogoImage.logo ?? UIImage()
    )
    
    private lazy var questionTextLabel = makeLabel(
        title: "Some text",
        font: UIFont.TextFont.Question.text,
        textColor: .customWhite
    )
    
    private lazy var questionAmountLabel = makeLabel(
        title: "N RUB",
        font: UIFont.TextFont.Question.amount,
        textColor: .customWhite
    )
    
    private lazy var questionNumberLabel = makeLabel(
        title: "Вопрос N",
        font: UIFont.TextFont.Question.label,
        textColor: .customWhite
    )
    
    private lazy var timerLabel = makeLabel(
        title: "30",
        font: UIFont.TextFont.Question.label,
        textColor: .customWhite
    )
    
    private lazy var getMoneyButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()    
        button.configuration?.title = "Забрать деньги"
        button.configuration?.cornerStyle = .medium
        button.configuration?.attributedTitle?.font = UIFont.TextFont.Question.label
        button.configuration?.baseForegroundColor = .customWhite
        button.configuration?.baseBackgroundColor = .customMint
        
        return button
    }()
    
    private lazy var answersVStack = makeStackView(axis: .vertical)
    
    private lazy var cluesHStack = makeStackView(axis: .horizontal)

    
    // MARK: Set Views
    override func setViews() {
        [
            backgroundImageView,
            logoImageView,
            questionTextLabel,
            questionNumberLabel,
            questionAmountLabel,
            timerLabel,
            getMoneyButton,
            answersVStack,
            cluesHStack,
        ].forEach { addSubview($0) }
    }
    
    // MARK: Layout Views
    override func layoutViews() {
        
        backgroundImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.top.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(5)
            make.left.equalTo(safeAreaLayoutGuide.snp.left).offset(10)
            make.width.height.equalTo(90)
        }
        
        questionTextLabel.adjustsFontSizeToFitWidth = true
        questionTextLabel.minimumScaleFactor = 0.5
        questionTextLabel.numberOfLines = 0
        questionTextLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        questionTextLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(5)
            make.left.equalTo(logoImageView.snp.right).offset(10)
            make.right.equalToSuperview().offset(-5)
            make.height.lessThanOrEqualTo(100)
        }
        
        questionNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(10)
            make.left.equalTo(safeAreaLayoutGuide.snp.left).offset(10)
        }
        questionAmountLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(10)
            make.right.equalTo(safeAreaLayoutGuide.snp.right).offset(-10)
        }
        
        answersVStack.snp.makeConstraints { make in
            make.top.equalTo(questionNumberLabel.snp.bottom).offset(30)
            make.left.equalTo(safeAreaLayoutGuide.snp.left).offset(30)
            make.centerX.equalTo(self)
        }
        
        timerLabel.snp.makeConstraints { make in
            make.top.equalTo(answersVStack.snp.bottom).offset(20)
            make.centerX.equalTo(self)
        }
        
        getMoneyButton.snp.makeConstraints { make in
            make.top.equalTo(timerLabel.snp.bottom).offset(20)
            make.top.left.greaterThanOrEqualToSuperview()
            make.centerX.equalTo(self)
        }
        
        cluesHStack.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-50)
            make.centerX.equalTo(self)
        }
        
        configureAnswersView()
        configureCluesView()
        
        getMoneyButton.addTarget(self, action: #selector(didTapGetMoneyButton), for: .touchUpInside)
    }
    
    func setQuestion(_ question: Question) {
        self.question = question
    }
    
    private func fillQuestionValues(question: Question) {
        setQuestionText(question.text)
        setQuestionAnswers(question.getAnswers())
    }
    
    private func setQuestionText(_ text: String) {
        questionTextLabel.text = text
    }
    
    private func setQuestionAmount(_ amount: Int) {
        questionAmountLabel.text = "\(String(amount)) RUB"
    }
    
    private func setQuestionNumber(_ number: Int) {
        questionNumberLabel.text = "Вопрос \(String(number))"
    }
    
    func setQuestionAnswers(_ answers: [String]) {
        for view in answersVStack.subviews {
            if let button = view as? AnswerButtonView {
                var localAnswers = answers
                button.setAnswerTextLabel(localAnswers.removeLast())
            }
        }
    }
    
    func updateTimerLabel(_ value: Int) {
        timerLabel.text = String(value)
    }
    
    func disableButtons() {
        for view in answersVStack.subviews {
            if let button = view as? AnswerButtonView {
                button.disable()
            }
        }
        
        for view in cluesHStack.subviews {
            if let button = view as? ClueButtonView {
                button.disable()
            }
        }
        
        getMoneyButton.isEnabled = false
    }
    
    func disableClue(_ clue: ClueTypes) {
        print("\(clue) disable")
    }
}

extension GameMainView {
    private func configureAnswersView() {
        ["A","B","C","D"].forEach { i in
            answerButton = AnswerButtonView(image: UIImage.ButtomImage.buttonBlue!, letter: i , text: "\(i) some var")
            answerButton?.delegate = self
            answersVStack.addArrangedSubview(answerButton!)
        }
    }
    
    private func configureCluesView() {
        ClueTypes.allCases.forEach { clue in
            clueButton = ClueButtonView(clue)
            clueButton?.delegate = self
            cluesHStack.addArrangedSubview(clueButton!)
        }}
}


// MARK: - UI Elements
extension GameMainView {
    
    private func makeImageView(image: UIImage) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image
        imageView.clipsToBounds = true
        return imageView
    }
    
    private func makeLabel(title: String, font: UIFont, textColor: UIColor? = nil) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = font
        label.textColor = textColor
        label.numberOfLines = 0
        return label
    }
    
    private func makeStackView(axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }
}



extension GameMainView {
    @objc func didTapGetMoneyButton(_ sender: UIButton) {
        delegate?.gameMainView(didTapButton: sender)
    }
}

extension GameMainView: AnswerButtonViewDelegate {
    func answerButtonView(didTapButton button: UIButton) {
        disableButtons()
        print("\(button.isEnabled)")
        answerButton?.didTapAnswerButton(button)
    }
    
}

extension GameMainView: ClueButtonViewDelegate {
    func clueButtonView(didTapButton button: ClueUIButton) {
        clueButton?.didTapClueButton(button)
    }
}
