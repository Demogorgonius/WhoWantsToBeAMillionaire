//
//  RegistrationViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Ilya on 28.02.2024.
//

import UIKit
import SnapKit
class RegistrationViewController: UIViewController {
    
    // Mark: - Views
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background-with-money")
        return imageView
    }()
    
    private let registrationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Регистрация", for: .normal)
        let customTextColor = UIColor(named: "custom-white")
        button.setTitleColor(customTextColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 24)
        button.backgroundColor = UIColor(named: "custom-cyan")
        button.layer.cornerRadius = 10.0
        return button
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите свой никнейм"
        let customTextColor = UIColor(named: "custom-white")
        label.textColor = customTextColor
        label.font = UIFont(name: "Roboto-Medium", size: 24)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor(named: "custom-white")?.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 10.0
        textField.textColor = UIColor.white
        textField.backgroundColor = UIColor.clear
        textField.tintColor = UIColor.black
        return textField
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupConstraint()
    }
    
    //Mark: - Funcs
    private func setupLayout() {
        
        self.view.addSubview(backgroundImageView)
        self.view.addSubview(logoImageView)
        self.view.addSubview(nicknameLabel)
        self.view.addSubview(textField)
        self.view.addSubview(registrationButton)
        
    }
    
    private func setupConstraint() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(201)
        }
        nicknameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoImageView.snp_bottomMargin).offset(20)
            $0.width.equalTo(261)
            $0.height.equalTo(47)
        }
        textField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(nicknameLabel.snp_bottomMargin).offset(24)
            $0.width.equalTo(261)
            $0.height.equalTo(47)
        }
        registrationButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(textField.snp_bottomMargin).offset(33)
            $0.width.equalTo(261)
            $0.height.equalTo(47)
        }
        
        
    }
}

