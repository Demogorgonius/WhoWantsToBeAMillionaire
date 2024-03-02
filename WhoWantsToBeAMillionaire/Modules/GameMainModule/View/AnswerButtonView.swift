//
//  AnswerButtonView.swift
//  WhoWantsToBeAMillionaire
//
//  Created by  Maksim Stogniy on 29.02.2024.
//

import UIKit
import SnapKit


protocol AnswerButtonViewDelegate: AnyObject {
    func answerButtonView(didTapButton button: UIButton)
}

final class AnswerButtonView: UIView {
    
    weak var delegate: AnswerButtonViewDelegate?
    
    private var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.contentMode = .scaleAspectFill
        button.configuration?.title = ""
        
        return button
    }()

    private let answerLetterLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font =  UIFont.TextFont.Buttons.answerButtonLetter
        label.textColor = .customWhite
        return label
    }()

    let answerTextLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font =  UIFont.TextFont.Buttons.answerButtonText
        label.textColor = .customWhite
        return label
    }()


    // MARK: Init
    init(image: UIImage?, letter: String, index: Int, text: String) {
        self.button.setBackgroundImage(image ?? UIImage(), for: .normal)
        self.button.tag = index
        self.answerLetterLabel.text = letter
        self.answerTextLabel.text = text
        super.init(frame: .zero)
        setViews()
        layoutViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setViews() {
        addSubview(button)
        [answerLetterLabel, answerTextLabel].forEach {
            button.addSubview($0)
        }
    }

    private func layoutViews() {
        button.snp.makeConstraints { make in
            make.bottom.top.left.right.equalToSuperview()
            make.height.equalTo(55)
        }

        answerLetterLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.bottom.equalToSuperview()
        }

        answerTextLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
        
        button.addTarget(self, action: #selector(didTapAnswerButton), for: .touchUpInside)
    }
    
    
    func changeButtonState(image: UIImage) {
        button.setBackgroundImage(image, for: .normal)
    }
    
    func setAnswerTextLabel(_ text: String) {
        answerTextLabel.text = text
    }
    
    func disable(_ state: Bool) {
        button.isEnabled = state
    }
    
    
}

extension AnswerButtonView {
    @objc func didTapAnswerButton(_ sender: UIButton) {
        delegate?.answerButtonView(didTapButton: sender)
    }
}
