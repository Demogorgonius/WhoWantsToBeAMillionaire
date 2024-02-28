//
//  QuestionView.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Nikolai Maksimov on 28.02.2024.
//

import UIKit
import SnapKit

final class QuestionView: UIView {
    
    // MARK: Private Properties
    private var backgroundView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let questionNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Вопрос 1"
        label.font =  UIFont.RobotoFont.Medium.size(of: 20)
        label.textColor = UIColor(named: "custom-white")
        return label
    }()
    
    private let questionPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "100 RUB"
        label.font =  UIFont.RobotoFont.Medium.size(of: 20)
        label.textColor = UIColor(named: "custom-white")
        return label
    }()
     
    
    // MARK: Init
    init(image: UIImage, number: String, price: String) {
        self.backgroundView.image = image
        self.questionNumberLabel.text = number
        self.questionPriceLabel.text = price
        super.init(frame: .zero)
        setViews()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Veiws
extension QuestionView {
    
    private func setViews() {
        addSubview(backgroundView)
        [questionNumberLabel, questionPriceLabel].forEach {
            backgroundView.addSubview($0)
        }
    }
    
    private func layoutViews() {
        
        backgroundView.snp.makeConstraints { make in
            make.bottom.top.left.right.equalToSuperview()
        }
        
        questionNumberLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.bottom.equalToSuperview()
        }
        
        questionPriceLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
    }
}

// MARK: - UI Element
extension QuestionView {
    
    private func makeLabel(title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font =  UIFont.RobotoFont.Medium.size(of: 20)
        label.textColor = UIColor(named: "custom-white")
        return label
    }
}
