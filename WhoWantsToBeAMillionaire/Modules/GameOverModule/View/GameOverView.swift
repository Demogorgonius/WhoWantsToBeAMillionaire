//
//  GameOverView.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Nikolai Maksimov on 28.02.2024.
//

import UIKit
import SnapKit

// MARK: - GameOverViewDelegate
protocol GameOverViewDelegate: AnyObject {
    func playAgainButtonPressed(_ button: UIButton)
}

// MARK: - GameOverView
final class GameOverView: CustomView {
    
    weak var delegate: GameOverViewDelegate?
    
    // MARK: Private Properties
    private lazy var backgroundImageView = makeImageView(
        image: UIImage.BackgroundImage.background ?? UIImage()
    )
    
    private lazy var logoImageView = makeImageView(
        image: UIImage.LogoImage.logo ?? UIImage()
    )
    
    private lazy var attemptTitleLabel = makeLabel(
        title: "You losed on {attempt} attempt",
        font: UIFont.RobotoFont.Regular.size(of: 24),
        textColor: UIColor(named: "custom-white")
    )
    
    private lazy var loseTitleLabel = makeLabel(
        title: "LOSE",
        font: UIFont.SyneFont.Regular.size(of: 50),
        textColor: UIColor(named: "custom-orange")
    )
    
    private lazy var playAgainButton = makeButton()
    
    // MARK: Configure Method
    func configure(attemptsCount value: Int) {
        attemptTitleLabel.text = "You losed on \(value) attempt"
    }
    
    // MARK: Set Views
    override func setViews() {
        [backgroundImageView, logoImageView,
         attemptTitleLabel, loseTitleLabel,
         playAgainButton].forEach { addSubview($0) }
        
        playAgainButton.addTarget(self, action: #selector(didTapPlayAgainButton), for: .touchUpInside)
    }
    
    // MARK: Layout Views
    override func layoutViews() {
        backgroundImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.top.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.width.height.equalTo(201)
            make.centerX.equalTo(self)
        }
        
        attemptTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(20)
            make.centerX.equalTo(self)
        }
        
        loseTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(attemptTitleLabel.snp.bottom).offset(20)
            make.centerX.equalTo(self)
        }
        
        playAgainButton.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(100)
            make.centerX.equalTo(self)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-50)
        }
    }
}


// MARK: - Actions
extension GameOverView {
    
    @objc
    private func didTapPlayAgainButton(_ button: UIButton) {
        delegate?.playAgainButtonPressed(playAgainButton)
    }
}


// MARK: - UI Elements
extension GameOverView {
    
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
    
    private func makeButton() -> UIButton {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.title = "PLAY AGAIN"
        button.configuration?.cornerStyle = .medium
        button.configuration?.attributedTitle?.font = UIFont.RobotoFont.Medium.size(of: 36)
        button.configuration?.baseForegroundColor = UIColor(named: "custom-white")
        button.configuration?.baseBackgroundColor = UIColor(named: "custom-green")
        return button
    }
}
