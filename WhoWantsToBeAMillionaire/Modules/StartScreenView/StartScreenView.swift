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
    func statButton(didTapButton button: UIButton)
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
        let customTextColor = UIColor(named: "custom-white")
        button.setTitleColor(customTextColor, for: .normal)
        button.titleLabel?.font = UIFont.TextFont.Welcome.menuItem
        button.setBackgroundImage(UIImage.ButtomImage.buttonBlue, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitle("Правила игры", for: .normal)
        
        return button
    }()
    
    let startGameButton: UIButton = {
        let button = UIButton()
        let customTextColor = UIColor(named: "custom-white")
        button.setTitleColor(customTextColor, for: .normal)
        button.titleLabel?.font = UIFont.TextFont.Welcome.menuItem
        button.setBackgroundImage(UIImage.ButtomImage.buttonBlue, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitle("Начало игры", for: .normal)

        return button
    }()
    
    let statButton: UIButton = {
        let button = UIButton()
        let customTextColor = UIColor(named: "custom-white")
        button.setTitleColor(customTextColor, for: .normal)
        button.titleLabel?.font = UIFont.TextFont.Welcome.menuItem
        button.setBackgroundImage(UIImage.ButtomImage.buttonBlue, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitle("Статистика", for: .normal)
        
        return button
    }()

    override func setViews() {
        self.addSubview(backgroundImageView)
        self.addSubview(titleLabel)
        self.addSubview(rulesButton)
        self.addSubview(startGameButton)
        self.addSubview(statButton)
        self.addSubview(logoImageView)
    }
    
    override func layoutViews() {
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(65)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(225)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoImageView.snp_bottomMargin).offset(50)
            $0.width.equalTo(404)
            $0.height.equalTo(92)
        }
        rulesButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp_bottomMargin).offset(107)
            $0.width.equalTo(300)
            $0.height.equalTo(74)
        }
        startGameButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(rulesButton.snp_bottomMargin).offset(20)
            $0.width.equalTo(300)
            $0.height.equalTo(74)
        }
        statButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(startGameButton.snp_bottomMargin).offset(20)
            $0.width.equalTo(300)
            $0.height.equalTo(74)
        }

        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        
        rulesButton.addTarget(self, action: #selector(didTapRulesButton), for: .touchUpInside)
        
        startGameButton.addTarget(self, action: #selector(didTapStartGameButton), for: .touchUpInside)
        
        statButton.addTarget(self, action: #selector(didTapStatButton), for: .touchUpInside)
    }

}

extension StartScreenView {
    @objc func didTapRulesButton(_ sender: UIButton) {
        delegate?.rulesButton(didTapButton: sender)
    }
    
    @objc func didTapStartGameButton(_ sender: UIButton) {
        delegate?.startGameButton(didTapButton: sender)
    }
    
    @objc func didTapStatButton(_ sender: UIButton) {
        delegate?.statButton(didTapButton: sender)
    }
}
