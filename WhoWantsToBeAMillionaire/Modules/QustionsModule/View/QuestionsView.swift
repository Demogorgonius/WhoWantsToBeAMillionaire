//
//  QuestionsView.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Nikolai Maksimov on 28.02.2024.
//

import UIKit
import SnapKit

final class QuestionsView: CustomView {
    
    // MARK: Private Properties
    private lazy var backgroundImageView = makeImageView(
        image: UIImage.BackgroundImage.background ?? UIImage()
    )
    
    private lazy var logoImageView = makeImageView(
        image: UIImage.LogoImage.logo ?? UIImage()
    )
    
    private lazy var questionsVStack = makeStackView()

    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureQuestionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setViews() {
        [backgroundImageView, logoImageView,
         questionsVStack].forEach { addSubview($0) }
    }
    
    override func layoutViews() {
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
    
    func changeBackgroundColor(at index: Int, type: ProgressType) {
        if type == .win {
            let currentImage = index <= 13 ? UIImage.ButtomImage.buttonGreen : UIImage.ButtomImage.buttonGold
            if let view = questionsVStack.subviews.reversed()[index] as? QuestionView {
                view.updateImage(with: currentImage ?? UIImage())
            }
        } else if type == .loose {
            let currentImage = index <= 13 ? UIImage.ButtomImage.buttonRed : UIImage.ButtomImage.buttonRed
            if let view = questionsVStack.subviews.reversed()[index] as? QuestionView {
                view.updateImage(with: currentImage ?? UIImage())
            }
        }
        
    }
}

// MARK: - Create and Setup Question View
extension QuestionsView {
    
    private func configureQuestionView() {
        let title = QuestionHelper.allCases
        var view: QuestionView?
        (0...QuestionHelper.allCases.count - 1).reversed().forEach { i in
            view = QuestionView(image: title[i].image,
                                number: title[i].rawValue,
                                    price: title[i].price)
            questionsVStack.addArrangedSubview(view ?? UIView())
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
