//
//  ResultTableViewCell.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Ilya on 02.03.2024.
//

import UIKit

final class ResultTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ResultTableViewCell"
    private let buttonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.ButtomImage.buttonBlue
        return imageView
    }()
    
    private let winningsLabel: UILabel = {
        let label = UILabel()
        let customTextColor = UIColor(named: "custom-white")
        label.textColor = customTextColor
        label.font = UIFont.TextFont.Question.label
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()
    
    private let numbersLabel: UILabel = {
        let label = UILabel()
        let customTextColor = UIColor(named: "custom-white")
        label.textColor = customTextColor
        label.font = UIFont.TextFont.Question.label
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        layoutViews()
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        self.addSubview(buttonImage)
        self.addSubview(winningsLabel)
        self.addSubview(numbersLabel)
    }
    
    private func layoutViews() {
        
        buttonImage.snp.makeConstraints {
            $0.left.right.top.equalToSuperview()
            $0.bottom.equalToSuperview().inset(23)
            $0.width.equalTo(321)
            $0.height.equalTo(54)
        }
        
        winningsLabel.snp.makeConstraints {
            $0.top.equalTo(buttonImage.snp.top).offset(15)
            $0.bottom.equalTo(buttonImage.snp.bottom).offset(-15)
            $0.right.equalTo(buttonImage.snp.right).offset(-15)
        }
        numbersLabel.snp.makeConstraints {
            $0.top.equalTo(buttonImage.snp.top).offset(15)
            $0.left.equalTo(buttonImage.snp.left).offset(15)
            $0.bottom.equalTo(buttonImage.snp.bottom).offset(-15)
            
        }
    }
    func setTitles(number: String, score: String) {
        numbersLabel.text = number
        winningsLabel.text = score
    }
    
}
