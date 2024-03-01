//
//  StartScreenView.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Ilya on 29.02.2024.
//

import UIKit
import SnapKit

protocol StartScreenViewDelegate: AnyObject {
    func rulesButton(didTapButton button: UIButton)
    func startGameButton(didTapButton button: UIButton)
}

class StartScreenView: CustomView {
    weak var delegate: StartScreenViewDelegate?
    
    // Mark: - Views
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.BackgroundImage.background
        return imageView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.LogoImage.logo
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Кто хочет стать миллионером?"
        let customTextColor = UIColor(named: "custom-white")
        label.textColor = customTextColor
        label.font = UIFont.TextFont.Welcome.logo
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let rulesButton: UIButton = {
        let button = UIButton()
        let customTextColor = UIColor(named: "custom-mint")
        button.setTitleColor(customTextColor, for: .normal)
        button.titleLabel?.font = UIFont.TextFont.Welcome.menuItem
        let underlinedString = NSAttributedString(
            string: "Правила игры",
            attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                         NSAttributedString.Key.foregroundColor: customTextColor as Any]
        )
        
        button.setAttributedTitle(underlinedString, for: .normal)
        
        return button
    }()
    
    let startGameButton: UIButton = {
        let button = UIButton()
        let customTextColor = UIColor(named: "custom-mint")
        button.setTitleColor(customTextColor, for: .normal)
        button.titleLabel?.font = UIFont.TextFont.Welcome.menuItem
        button.titleLabel?.textAlignment = .center
        
        let underlinedString = NSAttributedString(
            string: "Начало игры",
            attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                         NSAttributedString.Key.foregroundColor: customTextColor as Any]
        )
        
        button.setAttributedTitle(underlinedString, for: .normal)
        
        return button
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        let customTextColor = UIColor(named: "custom-white")
        label.textColor = customTextColor
        label.font = UIFont.TextFont.Welcome.label
        label.textAlignment = .left
        return label
    }()
    
    override func setViews() {
        self.addSubview(backgroundImageView)
        self.addSubview(titleLabel)
        self.addSubview(rulesButton)
        self.addSubview(startGameButton)
        self.addSubview(welcomeLabel)
        self.addSubview(logoImageView)
    }
    
    override func layoutViews() {
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(41)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(225)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(welcomeLabel.snp_bottomMargin).offset(9)
            $0.width.equalTo(404)
            $0.height.equalTo(92)
        }
        rulesButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp_bottomMargin).offset(107)
            $0.width.equalTo(215)
            $0.height.equalTo(74)
        }
        startGameButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(rulesButton.snp_bottomMargin).offset(6)
            $0.width.equalTo(215)
            $0.height.equalTo(74)
        }
        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoImageView.snp_bottomMargin).offset(17)
            $0.width.equalTo(110)
            $0.height.equalTo(28)
        }
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        
        rulesButton.addTarget(self, action: #selector(didTapRulesButton), for: .touchUpInside)
        
        startGameButton.addTarget(self, action: #selector(didTapStartGameButton), for: .touchUpInside)
    }

}

extension StartScreenView {
    @objc func didTapRulesButton(_ sender: UIButton) {
        delegate?.rulesButton(didTapButton: sender)
    }
    
    @objc func didTapStartGameButton(_ sender: UIButton) {
        delegate?.startGameButton(didTapButton: sender)
    }
}
