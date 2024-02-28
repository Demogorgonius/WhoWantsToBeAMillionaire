//
//  QuestionsView.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Nikolai Maksimov on 28.02.2024.
//

import UIKit
import SnapKit

final class QuestionsView: UIView {
        
    // MARK: Private Properties
    /// Фоновое изображение
    private lazy var backgroundImageView = makeImageView(
        image: UIImage.BackgroundImage.background ?? UIImage()
    )
    
    /// Логотип
    private lazy var logoImageView = makeImageView(
        image: UIImage.LogoImage.logo ?? UIImage()
    )
    
    /// Вертикальный Стек с 15 вопросами
    private lazy var questionsVStack = makeStackView()

    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        configureQuestionView()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setViews()
        layoutViews()
    }
}

// MARK: - Create and Setup Question View
extension QuestionsView {
    
    /// Создание и добавление в стек 15-ти вьюшек с номером вопроса и незгараемой суммой
    private func configureQuestionView() {
        (0...QuestionHelper.allCases.count - 1).reversed().forEach { i in
            let title = QuestionHelper.allCases
            let view = QuestionView(image: title[i].image, 
                                    number: title[i].rawValue,
                                    price: title[i].price)
            questionsVStack.addArrangedSubview(view)
        }
    }
}

// MARK: - Setup Views
extension QuestionsView {
    
    private func setViews() {
        [backgroundImageView, logoImageView,
         questionsVStack].forEach { addSubview($0) }
    }
    
    private func layoutViews() {
        backgroundImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.top.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.width.height.equalTo(80)
            make.centerX.equalTo(self)
        }
        
        questionsVStack.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(20)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.leading.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().offset(-34)
        }
    }
}

// MARK: - UI Elements
extension QuestionsView {

    private func makeImageView(image: UIImage? = nil) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image
        imageView.clipsToBounds = true
        return imageView
    }
        
    private func makeStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }
}
