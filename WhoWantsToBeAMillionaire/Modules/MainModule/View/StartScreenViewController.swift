//
//  StartScreenViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Ilya on 28.02.2024.
//

import UIKit
import SnapKit
class StartScreenViewController: UIViewController {
    
    // Mark: - Views
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        return imageView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Кто хочет стать миллионером?"
        let customTextColor = UIColor(named: "custom-white")
        label.textColor = customTextColor
        label.font = UIFont(name: "Roboto-Bold", size: 36)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let rulesButton: UIButton = {
        let button = UIButton()
        let customTextColor = UIColor(named: "custom-mint")
        button.setTitleColor(customTextColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 32)
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
        button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 32)
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
        label.font = UIFont(name: "Roboto-Regular", size: 24)
        label.textAlignment = .left
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupConstraint()
        
    }
    //Mark: - Funcs
    private func setupLayout() {
        
        self.view.addSubview(backgroundImageView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(rulesButton)
        self.view.addSubview(startGameButton)
        self.view.addSubview(welcomeLabel)
        self.view.addSubview(logoImageView)
    }
    
    private func setupConstraint() {
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
        
    }
}