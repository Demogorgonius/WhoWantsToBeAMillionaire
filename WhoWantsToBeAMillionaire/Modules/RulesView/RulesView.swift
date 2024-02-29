//
//  RulesView.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Ilya on 29.02.2024.
//

import UIKit
import SnapKit

enum constant {
    static let rulesText = "Для того, чтобы выиграть, необходимо правильно ответить на 15 вопросов из различных областей знаний. \nКаждый вопрос имеет 4 варианта ответа, из которых только один является верным. \nВ любой момент игрок может остановиться и забрать деньги. \nВ случае неверного ответа выигрыш участника сокращается до ближайшей достигнутой «несгораемой» суммы, и он прекращает участие в игре. \nПомочь в этом непростом деле вам смогут только ваша эрудиция и подсказки."
}
class RulesView: CustomView {
    
    // Mark: - Views
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.BackgroundImage.background
        return imageView
    }()
    let rulesLabel: UILabel = {
        let label = UILabel()
        label.text = "ПРАВИЛА:"
        let customTextColor = UIColor(named: "custom-white")
        label.textColor = customTextColor
        label.font = UIFont.TextFont.Welcome.logo
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = constant.rulesText
        let customTextColor = UIColor(named: "custom-white")
        label.textColor = customTextColor
        label.font = UIFont.TextFont.Welcome.label
        label.textAlignment = .center
        label.numberOfLines = 0
        label.alpha = 0.8
        return label
    }()
    override func setViews() {
        self.addSubview(backgroundImageView)
        self.addSubview(titleLabel)
        self.addSubview(rulesLabel)
    }
    override func layoutViews() {
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
                $0.leading.trailing.equalToSuperview().inset(16)
                $0.centerY.equalToSuperview()
            }
        rulesLabel.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.bottom.equalTo(titleLabel.snp.top).offset(-9)  // Place rulesLabel above titleLabel
                $0.width.equalToSuperview().inset(16)            // Adjust the width
                $0.height.equalTo(25)
            }
        
    }
    
}
