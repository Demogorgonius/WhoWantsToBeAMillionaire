//
//  GameScreenView.swift
//  WhoWantsToBeAMillionaire
//
//  Created by  Maksim Stogniy on 28.02.2024.
//

import UIKit
import SnapKit

class GameMainView: CustomView {
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
    
    private lazy var answersVStack = makeStackView(axis: .vertical)
    private lazy var cluesHStack = makeStackView(axis: .horizontal)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAnswersView()
        configureCluesView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set Views
    override func setViews() {
        [
            backgroundImageView,
            logoImageView,
            questionTextLabel,
            questionNumberLabel,
            questionAmountLabel,
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
            make.left.equalTo(safeAreaLayoutGuide.snp.left).offset(10)
            make.leading.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().offset(-34)
        }
        
        cluesHStack.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-50)
            make.leading.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().offset(-34)
        }
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
    
    private func setQuestionAnswers(_ answers: [String]) {
        for view in answersVStack.subviews {
            if let button = view as? UIButton {
                var localAnswers = answers
                button.setTitle(localAnswers.removeLast(), for: .normal)
            }
        }
    }
}
// MARK: - Actions
extension GameMainView {
    @objc
    private func questionAnswerHadler(_ button: UIButton) {
        print("Button tapped")
    }
    
    @objc
    private func clueButtonHadler(_ button: UIButton) {
        print("Button tapped")
    }
}

extension GameMainView {
    private func configureAnswersView() {
        ["A","B","C","D"].forEach { i in
            let answerButton = AnswerButtonView(image: UIImage.ButtomImage.buttonBlue!, letter: i , text: "\(i) some var")
//            answerButton.addTarget(selector: #selector(questionAnswerHadler))
            answersVStack.addArrangedSubview(answerButton)
        }
    }
    
    private func configureCluesView() {
        [
            UIImage.CluesImage.clueFiftyPercent,
            UIImage.CluesImage.clueCall,
            UIImage.CluesImage.cluePeopleHelp
        ].forEach { image in
            let clueButton = ClueButtonView(image: image!)
//            clueButton.addTarget(selector: #selector(clueButtonHadler))
            cluesHStack.addArrangedSubview(clueButton)
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

